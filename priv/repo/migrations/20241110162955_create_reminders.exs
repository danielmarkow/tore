defmodule Tore.Repo.Migrations.CreateReminders do
  use Ecto.Migration

  def change do
    create table(:reminders, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :scheduled_at, :utc_datetime
      add :period, :string
      add :finished_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
