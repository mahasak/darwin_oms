defmodule DarwinOms.Repo do
  use Ecto.Repo,
    otp_app: :darwin_oms,
    adapter: Ecto.Adapters.Postgres
end
