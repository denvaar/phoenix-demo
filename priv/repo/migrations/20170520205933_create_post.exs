defmodule PhoenixBlog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :author, :string
      add :content, :string
      add :likes, :integer
      add :reads, :integer

      timestamps()
    end

  end
end
