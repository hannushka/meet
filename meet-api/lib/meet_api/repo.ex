defmodule MeetApi.Repo do
    alias MeetApi.Accounts

    def get_nodes(conn, type) do
        users = conn
        |> Bolt.Sips.query!(
            "MATCH (n:#{type})
            RETURN n")
        |> return_list()
        {:ok, users}
    end

    def create_node(conn, type, struct) do
        props = struct_to_props(struct)
        conn
        |> Bolt.Sips.query!(
            """
            CREATE (n:#{type}{#{props}})
            RETURN n
            """
        )
        |> return_list()
        |> case do
            [] -> :error
            [node] -> {:ok, node}
        end
    end

    def get_node(conn, type, id) do
        conn
        |> Bolt.Sips.query!(
            """
            MATCH (n:#{type})
            WHERE ID(n) = #{id}
            RETURN n
            """
        )
        |> return_list()
        |> case do
            [] -> :error
            [node] -> {:ok, node}
        end
    end

    defp return_list(return) when is_list(return) do
        Enum.map(return, &to_struct/1)
    end

    defp to_struct(
            %{
            "n" => node
            }
        ) do
        row_to_struct(node)
    end

    defp row_to_struct(node = %Bolt.Sips.Types.Node{labels: [type | _]}) do
        schema_module = type_to_repo_module(type)
        schema_module.row_to_struct(node)
    end

    defp type_to_repo_module("User") do
       Accounts.User
    end

    defp struct_to_props(struct) do
        struct
        |> Map.drop([:__struct__, :__meta__])
        |> Map.to_list()
        |> Enum.map_join(", ", fn {key, value} -> "#{key}: '#{value}'" end)
    end
end