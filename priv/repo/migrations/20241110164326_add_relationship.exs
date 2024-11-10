defmodule Tore.Repo.Migrations.AddRelationship do
  use Ecto.Migration

  def change do
    alter table(:notifications) do
      add :reminder_id, references(:reminders, type: :uuid)
    end
  end
end
