defmodule MeetApiWeb.Router do
  use MeetApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MeetApiWeb do
    pipe_through :api
  end
end
