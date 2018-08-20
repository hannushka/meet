defmodule MeetApi.Repo do

    def get_nodes(conn, type) do
        conn
        |> Bolt.Sips.query!(
            "MATCH (n:#{type}) 
            return n")
        |> return_list()
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

    def row_to_struct(node = %Bolt.Sips.Types.Node{labels: [type | _]}) do
        repo_schema_module = type_to_repo_module(type)
        repo_schema_module.row_to_struct(node)
    end

    def type_to_repo_module("User") do
       MeetApi.Accounts.User
    end
end