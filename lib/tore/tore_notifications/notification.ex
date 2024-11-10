defmodule Tore.ToreNotifications.Notification do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "notifications" do
    field :title, :string
    field :dismissed_at, :utc_datetime
    field :reminder_id, Ecto.UUID

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(notification, attrs) do
    notification
    |> cast(attrs, [:title, :dismissed_at, :reminder_id])
    |> validate_required([:title, :dismissed_at, :reminder_id])
  end
end
