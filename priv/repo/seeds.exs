# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tore.Repo.insert!(%Tore.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Tore.Repo
alias Tore.ToreReminders.Reminder

%Reminder{
  period: :weekly,
  title: "buy milk",
  scheduled_at: ~U[2024-11-10 16:04:46Z]
} |> Repo.insert!()

%Reminder{
  period: :monthly,
  title: "buy toilet paper",
  scheduled_at: ~U[2024-09-23 12:04:46Z]
} |> Repo.insert!()

%Reminder{
  period: :yearly,
  title: "chill out",
  scheduled_at: ~U[2023-01-22 08:02:46Z]
} |> Repo.insert!()
