# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :meet_api,
  ecto_repos: [MeetApi.Repo]

# Configures the endpoint
config :meet_api, MeetApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "g+PlS5EnS5g19kH/aNwghSJyWjtUHrNAlFncodpOUp6II2wbm+S6IYUiVkdIX8WA",
  render_errors: [view: MeetApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MeetApi.PubSub,
           adapter: Phoenix.PubSub.PG2],
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg|json)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/your_app_web/views/.*(ex)$},
      ~r{lib/your_app_web/controllers/.*(ex)$},
      ~r{lib/your_app_web/templates/.*(eex)$}
    ]
  ],
  reloadable_compilers: [:gettext, :phoenix, :elixir, :phoenix_swagger]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :ueberauth, Ueberauth,
  base_path: "/api/auth",
  providers: [
    identity: {Ueberauth.Strategy.Identity, [
      callback_methods: ["POST"],
      nickname_field: :email,
      param_nesting: "user",
      uid_field: :email
    ]}
  ]

config :meet_api, MeetApi.Guardian,
  issuer: "MeetApi",
  secret_key: "use mix phx.gen.secret yo"

config :meet_api, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      router: MeetApiWeb.Router
    ]
  }

# Configure the authentication plug pipeline
config :meet_api, MeetApiWeb.Plugs.AuthAccessPipeline,
  module: MeetApi.Guardian,
  error_handler: MeetApiWeb.Plugs.AuthErrorHandler
 

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"