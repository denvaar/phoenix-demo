# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_blog,
  ecto_repos: [PhoenixBlog.Repo]

# Configures the endpoint
config :phoenix_blog, PhoenixBlog.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5Rum66U6H8gWJOuJHLHrTHQY6T6qWuBIOTKjv7wfTqfaHq1xQpiyOoh/Mlu9keU5",
  render_errors: [view: PhoenixBlog.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixBlog.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :scrivener_html,
  routes_helper: PhoenixBlog.Router.Helpers

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "PhoenixBlog",
  ttl: { 1, :days },
  allowed_drift: 2000,
  secret_key: "whFqxqsfChV6OSCTZtEt3gntNsRpForkM4DYb+dxhLzD80ASMwmZT9UEh2nr8/Us",
  serializer: PhoenixBlog.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
