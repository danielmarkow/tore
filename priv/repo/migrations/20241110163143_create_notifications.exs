defmodule Tore.Repo.Migrations.CreateNotifications do
  use Ecto.Migration

  def change do
    create table(:notifications, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :dismissed_at, :utc_datetime
      add :reminder_id, :uuid

      timestamps(type: :utc_datetime)
    end
  end
end
