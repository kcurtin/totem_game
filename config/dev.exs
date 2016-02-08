use Mix.Config

config :totem, Totem.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "totem",
  username: "postgres",
  password: "postgres"

