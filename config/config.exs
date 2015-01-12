# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the router
config :o_auth2_example, OAuth2Example.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1r3bLthfeEv3UBkhdSdgff6dvQUgd6v42eeQVlxsgjG9dUfcLIcPoxtiJDcZrFeLliKA0UJs0w4kJ8ovm6ynfQ==",
  debug_errors: false,
  oauth2: {OAuth2.Strategy.AuthCode, [
    client_id: System.get_env("CLIENT_ID"),
    client_secret: System.get_env("CLIENT_SECRET"),
    site: "https://api.github.com",
    authorize_url: "https://github.com/login/oauth/authorize",
    token_url: "https://github.com/login/oauth/access_token"]}

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"