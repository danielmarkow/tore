defmodule Tore.Repo.Migrations.Relationship do
  use Ecto.Migration

  def change do
    alter table(:notifications) do
      remove :reminder_id
    end
  end
end
