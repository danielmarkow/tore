defmodule Tore.ToreNotificationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tore.ToreNotifications` context.
  """

  @doc """
  Generate a notification.
  """
  def notification_fixture(attrs \\ %{}) do
    {:ok, notification} =
      attrs
      |> Enum.into(%{
        dismissed_at: ~U[2024-11-09 16:31:00Z],
        reminder_id: "7488a646-e31f-11e4-aace-600308960662",
        title: "some title"
      })
      |> Tore.ToreNotifications.create_notification()

    notification
  end
end
