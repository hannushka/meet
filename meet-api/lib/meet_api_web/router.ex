defmodule MeetApiWeb.Router do
  use MeetApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug MeetApiWeb.Plugs.AuthAccessPipeline
  end

  scope "/api", MeetApiWeb do
    pipe_through :api

    scope "/auth" do
      post "/identity/callback", AuthenticationController, :identity_callback
    end

    pipe_through :authenticated

    resources "/users", UserController, except: [:new, :edit]
  end
end
