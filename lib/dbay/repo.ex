defmodule Dbay.Repo do
  use Ecto.Repo,
    otp_app: :dbay,
    adapter: Ecto.Adapters.Postgres
end
