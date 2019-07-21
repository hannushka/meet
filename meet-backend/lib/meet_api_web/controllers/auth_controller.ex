defmodule MeetApiWeb.AuthController do
  use MeetApiWeb, :controller
  use PhoenixSwagger

  alias MeetApi.Accounts

  plug(Ueberauth)

  def identity_callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    username = auth.uid
    password = auth.credentials.other.password
    handle_user_conn(Accounts.authenticate_user(Bolt.Sips.conn(), username, password), conn)
  end

  defp handle_user_conn(user, conn) do
    case user do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = MeetApi.Guardian.encode_and_sign(user, %{})

        conn
        |> put_resp_header("authorization", "Bearer #{jwt}")
        |> json(%{data: %{token: jwt}})

      :error ->
        conn
        |> put_status(401)
        |> json(%{message: "wrong email or password"})
    end
  end

  swagger_path :ping do
    get "/api/ping"
    description "Ping"
    response 200, "Success"
  end

  def ping(conn, _params) do
    conn
    |> put_status(:ok)
    |> json("pong")
  end
end
