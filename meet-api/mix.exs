defmodule MeetApi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :meet_api,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {MeetApi.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.3"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:corsica, "~> 1.0"},
      {:bcrypt_elixir, "~> 1.0"},
      {:bolt_sips, "~> 0.4.12"},
      {:ueberauth, "~> 0.5.0"},
      {:ueberauth_identity, "~> 0.2.3"},
      {:guardian, "~> 1.0"},
      {:comeonin, "~> 4.1"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  defp aliases() do
    [compile: "compile --warnings-as-errors"]
  end
end
