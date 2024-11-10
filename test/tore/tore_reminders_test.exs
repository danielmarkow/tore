defmodule Tore.ToreRemindersTest do
  use Tore.DataCase

  alias Tore.ToreReminders

  describe "reminders" do
    alias Tore.ToreReminders.Reminder

    import Tore.ToreRemindersFixtures

    @invalid_attrs %{period: nil, title: nil, scheduled_at: nil, finished_at: nil}

    test "list_reminders/0 returns all reminders" do
      reminder = reminder_fixture()
      assert ToreReminders.list_reminders() == [reminder]
    end

    test "get_reminder!/1 returns the reminder with given id" do
      reminder = reminder_fixture()
      assert ToreReminders.get_reminder!(reminder.id) == reminder
    end

    test "create_reminder/1 with valid data creates a reminder" do
      valid_attrs = %{period: "some period", title: "some title", scheduled_at: ~U[2024-11-09 16:29:00Z], finished_at: ~U[2024-11-09 16:29:00Z]}

      assert {:ok, %Reminder{} = reminder} = ToreReminders.create_reminder(valid_attrs)
      assert reminder.period == "some period"
      assert reminder.title == "some title"
      assert reminder.scheduled_at == ~U[2024-11-09 16:29:00Z]
      assert reminder.finished_at == ~U[2024-11-09 16:29:00Z]
    end

    test "create_reminder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ToreReminders.create_reminder(@invalid_attrs)
    end

    test "update_reminder/2 with valid data updates the reminder" do
      reminder = reminder_fixture()
      update_attrs = %{period: "some updated period", title: "some updated title", scheduled_at: ~U[2024-11-10 16:29:00Z], finished_at: ~U[2024-11-10 16:29:00Z]}

      assert {:ok, %Reminder{} = reminder} = ToreReminders.update_reminder(reminder, update_attrs)
      assert reminder.period == "some updated period"
      assert reminder.title == "some updated title"
      assert reminder.scheduled_at == ~U[2024-11-10 16:29:00Z]
      assert reminder.finished_at == ~U[2024-11-10 16:29:00Z]
    end

    test "update_reminder/2 with invalid data returns error changeset" do
      reminder = reminder_fixture()
      assert {:error, %Ecto.Changeset{}} = ToreReminders.update_reminder(reminder, @invalid_attrs)
      assert reminder == ToreReminders.get_reminder!(reminder.id)
    end

    test "delete_reminder/1 deletes the reminder" do
      reminder = reminder_fixture()
      assert {:ok, %Reminder{}} = ToreReminders.delete_reminder(reminder)
      assert_raise Ecto.NoResultsError, fn -> ToreReminders.get_reminder!(reminder.id) end
    end

    test "change_reminder/1 returns a reminder changeset" do
      reminder = reminder_fixture()
      assert %Ecto.Changeset{} = ToreReminders.change_reminder(reminder)
    end
  end
end
