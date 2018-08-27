defmodule MeetApiWeb.UserController do
  use MeetApiWeb, :controller

  alias MeetApi.Accounts

  action_fallback MeetApiWeb.FallbackController

  def index(conn, _params) do
    {:ok, users} = Accounts.list_users(Bolt.Sips.conn)
    conn
    |> put_status(:ok)
    |> render(MeetApiWeb.UserView, "index.json", users: users) 
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(Bolt.Sips.conn, user_params) do
      {:ok, user} -> conn
        |> put_status(:created)
        |> put_resp_header("location", user_path(conn, :show, user))
        |> render(MeetApiWeb.UserView, "show.json", user: user)
      {:error, msg} -> conn
        |> put_status(422)
        |> render(MeetApiWeb.ErrorView, "error.json", message: msg)  
    end
  end

  def show(conn, %{"id" => id}) do
    case Accounts.get_user(Bolt.Sips.conn, id) do
      {:ok, user} -> conn
        |> put_status(:ok)
        |> render(MeetApiWeb.UserView, "show.json", user: user)
      :error -> conn
        |> put_status(422)
        |> json(%{})
    end
  end
end
