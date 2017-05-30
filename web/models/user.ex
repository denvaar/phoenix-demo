defmodule PhoenixBlog.User do
  use PhoenixBlog.Web, :model

  schema "users" do
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :password_hash])
    |> validate_required([:name, :password_hash])
  end

end
