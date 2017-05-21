defmodule PhoenixBlog.Post do
  use PhoenixBlog.Web, :model

  @derive {Phoenix.Param, key: :slug}
  schema "posts" do
    field :title, :string
    field :author, :string
    field :content, :string
    field :likes, :integer, default: 0
    field :reads, :integer, default: 0
    field :is_published, :boolean, default: false
    field :slug, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    params = Map.merge(params, slug_map(params))
    
    struct
    |> cast(params, [:title, :author, :content, :likes, :reads, :is_published, :slug])
    |> validate_required([:title, :author, :content, :is_published])
  end
  
  defp slug_map(%{"title" => title}) do
    slug = String.downcase(title) |> String.replace(" ", "-")
    %{"slug" => slug}
  end
  defp slug_map(_params) do
    %{}
  end
end
