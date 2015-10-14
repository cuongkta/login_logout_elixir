defmodule Blog.Repo do
  #use Ecto.Repo, otp_app: :blog

  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, otp_app: :blog

end
