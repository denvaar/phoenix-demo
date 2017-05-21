defmodule PhoenixBlog.PostView do
  use PhoenixBlog.Web, :view
  import Scrivener.HTML
  
  def as_html(text) do
    text
    |> Earmark.as_html!
    |> raw
  end
end
