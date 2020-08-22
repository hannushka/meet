defmodule MeetApiWeb.UserController do
  use MeetApiWeb, :controller
  alias MeetApi.Accounts

  action_fallback(MeetApiWeb.FallbackController)

  def index(conn, _params) do
    {:ok, users} = Accounts.list_users(Bolt.Sips.conn())
    conn
    |> put_status(:ok)
    |> render(MeetApiWeb.UserView, "index.json", users: users)
  end

  def create(conn, user_params) do
    case Accounts.create_user(Bolt.Sips.conn(), user_params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", user_path(conn, :show, user))
        |> render(MeetApiWeb.UserView, "show.json", user: user)

      {:error, msg} ->
        conn
        |> put_status(422)
        |> render(MeetApiWeb.ErrorView, "error.json", message: msg)
    end
  end

  def show(conn, %{"id" => id}) do
    case Accounts.get_user(Bolt.Sips.conn(), id) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render(MeetApiWeb.UserView, "show.json", user: user)

      :error ->
        conn
        |> put_status(422)
        |> json(%{})
    end
  end

  use PhoenixSwagger

  swagger_path :index do
    get "/api/users"
    description "List all users"
    produces "application/json"
    response 200, "OK", Schema.ref(:Users)
  end

  swagger_path :create do
    post "/api/users"
    description "Create a user"
    produces "application/json"
    parameters do
      user :body, Schema.ref(:User), "user attributes"
    end
    response 200, "OK", Schema.ref(:User)
  end

  swagger_path :show do
    get "/api/users/{id}"
    description "Get user"
    produces "application/json"
    parameters do
      id :path, :string, "User id"
    end
    response 200, "OK", Schema.ref(:User)
  end

  def swagger_definitions do
    %{
      User: swagger_schema do
        title "User"
        description "A user of the application"
        properties do
          id :string, "Unique identifier", required: true
          email :string, "User's email", required: true
          name :string, "Users name", required: true
          lastname :string, "Users lastname", required: true
          password :string, "Users password", required: true
        end
        example %{
          email: "janedoe@email.com",
          name: "Jane",
          lastname: "Doe",
          password: "password"
        }
      end,
      Users: swagger_schema do
        title "Users"
        description "A collection of Users"
        type :array
        items Schema.ref(:User)
      end
    }
  end
end
