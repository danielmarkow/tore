defmodule Tore.ToreNotificationsTest do
  use Tore.DataCase

  alias Tore.ToreNotifications

  describe "notifications" do
    alias Tore.ToreNotifications.Notification

    import Tore.ToreNotificationsFixtures

    @invalid_attrs %{title: nil, dismissed_at: nil, reminder_id: nil}

    test "list_notifications/0 returns all notifications" do
      notification = notification_fixture()
      assert ToreNotifications.list_notifications() == [notification]
    end

    test "get_notification!/1 returns the notification with given id" do
      notification = notification_fixture()
      assert ToreNotifications.get_notification!(notification.id) == notification
    end

    test "create_notification/1 with valid data creates a notification" do
      valid_attrs = %{title: "some title", dismissed_at: ~U[2024-11-09 16:31:00Z], reminder_id: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %Notification{} = notification} = ToreNotifications.create_notification(valid_attrs)
      assert notification.title == "some title"
      assert notification.dismissed_at == ~U[2024-11-09 16:31:00Z]
      assert notification.reminder_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_notification/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ToreNotifications.create_notification(@invalid_attrs)
    end

    test "update_notification/2 with valid data updates the notification" do
      notification = notification_fixture()
      update_attrs = %{title: "some updated title", dismissed_at: ~U[2024-11-10 16:31:00Z], reminder_id: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %Notification{} = notification} = ToreNotifications.update_notification(notification, update_attrs)
      assert notification.title == "some updated title"
      assert notification.dismissed_at == ~U[2024-11-10 16:31:00Z]
      assert notification.reminder_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_notification/2 with invalid data returns error changeset" do
      notification = notification_fixture()
      assert {:error, %Ecto.Changeset{}} = ToreNotifications.update_notification(notification, @invalid_attrs)
      assert notification == ToreNotifications.get_notification!(notification.id)
    end

    test "delete_notification/1 deletes the notification" do
      notification = notification_fixture()
      assert {:ok, %Notification{}} = ToreNotifications.delete_notification(notification)
      assert_raise Ecto.NoResultsError, fn -> ToreNotifications.get_notification!(notification.id) end
    end

    test "change_notification/1 returns a notification changeset" do
      notification = notification_fixture()
      assert %Ecto.Changeset{} = ToreNotifications.change_notification(notification)
    end
  end
end
