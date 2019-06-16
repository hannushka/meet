defmodule MeetApiWeb.Router do
  use MeetApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :authenticated do
    plug(MeetApiWeb.Plugs.AuthAccessPipeline)
  end

  scope "/api", MeetApiWeb do
    pipe_through(:api)

    get("/ping", AuthController, :ping)
    post("/users", UserController, :create)
    get("/users", UserController, :index)
    get("/users/:id", UserController, :show)

    scope "/auth" do
      post("/identity/callback", AuthController, :identity_callback)
    end

    pipe_through(:authenticated)

  end
end
