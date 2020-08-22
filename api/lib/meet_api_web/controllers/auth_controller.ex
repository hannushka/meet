defmodule MeetApiWeb.AuthController do
  use MeetApiWeb, :controller

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

  def ping(conn, _params) do
    conn
    |> put_status(:ok)
    |> json("pong")
  end

  use PhoenixSwagger
  
  swagger_path :ping do
    get "/api/ping"
    description "Ping"
    produces "application/json"
    response 200, "Success"
  end

  swagger_path :identity_callback do
    post "/api/auth/identity/callback"
    description "Get access token"
    produces "application/json"
    parameters do
      user :body, Schema.ref(:LoginCredentials), "Login credentials"
    end
    response 200, "Success"
    response 401, "Unauthorized"
  end

  def swagger_definitions do
    %{
      LoginCredentials: swagger_schema do
        title "Login credentials"
        description "Login credentials for a user of the application"
        properties do
          email :string, "User's email", required: true
          password :string, "Users password", required: true
        end
        example %{
          email: "janedoe@email.com",
          password: "password"
        }
      end
    }
  end
  
end
