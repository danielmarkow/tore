defmodule Tore.ToreRemindersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tore.ToreReminders` context.
  """

  @doc """
  Generate a reminder.
  """
  def reminder_fixture(attrs \\ %{}) do
    {:ok, reminder} =
      attrs
      |> Enum.into(%{
        finished_at: ~U[2024-11-09 16:29:00Z],
        period: "some period",
        scheduled_at: ~U[2024-11-09 16:29:00Z],
        title: "some title"
      })
      |> Tore.ToreReminders.create_reminder()

    reminder
  end
end
