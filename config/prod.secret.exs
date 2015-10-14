use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :blog, Blog.Endpoint,
  secret_key_base: "x6ymtgJbPizUNI4MhA+xa+SbK7I+Nvpnu4welL6S/OCSCQysIgVveTdrmaORQ5u1"

# Configure your database
config :blog, Blog.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  size: 20 # The amount of database connections in the pool
