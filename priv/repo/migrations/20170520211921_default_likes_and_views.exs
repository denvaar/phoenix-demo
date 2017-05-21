defmodule PhoenixBlog.Repo.Migrations.DefaultLikesAndViews do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      modify :likes, :integer, default: 0
      modify :reads, :integer, default: 0
    end
  end
end
