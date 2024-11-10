defmodule Tore.Repo do
  use Ecto.Repo,
    otp_app: :tore,
    adapter: Ecto.Adapters.Postgres
end
