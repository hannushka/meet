defmodule MeetApiWeb.UserView do
  use MeetApiWeb, :view
  alias MeetApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      name: user.name,
      lastname: user.lastname,
      password: user.password}
  end
end
