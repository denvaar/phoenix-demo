use Mix.Config

config :phoenix_blog, PhoenixBlog.Endpoint,
  http: [port: 4000],
  url: [host: "127.0.0.1", port: 4000],
  cache_static_manifest: "priv/static/manifest.json",
  server: true

config :logger, level: :info

#config :phoenix_blog, PhoenixBlog.Repo,
#  adapter: Ecto.Adapters.Postgres,
#  url: System.get_env("DATABASE_URL"),
#  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

import_config "prod.secret.exs"
