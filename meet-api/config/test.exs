use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :meet_api, MeetApiWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
config :bcrypt_elixir, :log_rounds, 4

config :bolt_sips, Bolt,
  url: 'localhost:7688',
  basic_auth: [username: "neo4j", password: "meet2018"],
  pool_size: 5,
  max_overflow: 1
