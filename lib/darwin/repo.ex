defmodule Darwin.Repo do
  use Ecto.Repo,
    otp_app: :darwin,
    adapter: Ecto.Adapters.Postgres
end
