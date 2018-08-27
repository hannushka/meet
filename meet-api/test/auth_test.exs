defmodule MeetApi.AuthTest do
    use MeetApiWeb.ConnCase
    use MeetApi.Neo4jConnCase
    import Phoenix.ConnTest

    alias MeetApi.Accounts

    @valid_attrs %{email: "some email", lastname: "some lastname", name: "some name", password: "some password"}

    test "GET /users with valid JWT", %{bolt_sips_conn: bolt_sips_conn, conn: conn} do
        {:ok, user} = Accounts.create_user(bolt_sips_conn, @valid_attrs)
        {:ok, jwt, _full_claims} = MeetApi.Guardian.encode_and_sign(user, %{})
        conn = conn
        |> put_req_header("authorization", "Bearer #{jwt}")
        |> get(user_path(conn, :index))
        assert json_response(conn, 200)
    end

    test "GET /users with invalid JWT", %{conn: conn} do
        conn = conn
        |> put_req_header("authorization", "Bearer invalid")
        |> get(user_path(conn, :index))
        assert json_response(conn, 401)
    end

    test "GET /users without JWT", %{conn: conn} do
        conn = conn
        |> get(user_path(conn, :index))
        assert json_response(conn, 401)
    end
end