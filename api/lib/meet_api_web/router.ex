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

  scope "/api/swagger" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI, otp_app: :meet_api, swagger_file: "swagger.json"
  end

  def swagger_info do
    %{
      info: %{
        version: "1.0",
        title: "Meet Api"
      }
    }
  end
end
