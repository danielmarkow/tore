defmodule Tore.ToreReminders.Reminder do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "reminders" do
    field :period, Ecto.Enum, values: [:hourly, :daily, :weekly, :monthly, :yearly, :oneoff]
    field :title, :string
    field :scheduled_at, :utc_datetime
    field :finished_at, :utc_datetime, default: nil
    has_many :notifications, Tore.ToreNotifications.Notification

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(reminder, attrs) do
    reminder
    |> cast(attrs, [:title, :scheduled_at, :period, :finished_at])
    |> validate_required([:title, :scheduled_at, :period, :finished_at])
  end
end
