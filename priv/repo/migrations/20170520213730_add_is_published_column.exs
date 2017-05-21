defmodule PhoenixBlog.Repo.Migrations.AddIsPublishedColumn do
  use Ecto.Migration

  def up do
    alter table(:posts) do
      add :is_published, :boolean, null: false, default: false
    end
  end

  def down do
    alter table(:posts) do
      remove :is_published
    end
  end
end
