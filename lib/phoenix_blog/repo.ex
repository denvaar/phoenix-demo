defmodule PhoenixBlog.Repo do
  use Ecto.Repo, otp_app: :phoenix_blog
  use Scrivener, page_size: 3 
end
