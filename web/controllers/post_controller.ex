defmodule PhoenixBlog.PostController do
  use PhoenixBlog.Web, :controller

  alias PhoenixBlog.Post
  alias PhoenixBlog.ImageUploader
  
  plug Guardian.Plug.EnsureAuthenticated,
    [handler: PhoenixBlog.SessionController] when not action in [:index, :show, :like_post]

  def index(conn, params) do
    page = Post
           |> Post.sorted
           |> Repo.paginate(params)
    render(conn, "index.html", posts: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, post_params)
    
    case Repo.insert(changeset) do
      {:ok, _post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: post_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get_by!(Post, slug: id)
    changeset = Post.changeset(post, %{reads: post.reads + 1})
    Repo.update!(changeset)
    render(conn, "show.html", post: post)
  end

  def edit(conn, %{"id" => id}) do
    post = Repo.get_by!(Post, slug: id)
    changeset = Post.changeset(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def like_post(conn, %{"id" => id}) do
    post = Repo.get(Post, id)
    changeset = Post.changeset(post, %{likes: post.likes + 1})
    
    case Repo.update(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "You liked this post!")
        render(conn, "likes.json", likes: post.likes)
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Error trying to update post.")
        render(conn, "likes.json", likes: post.likes)
    end
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    IO.inspect post_params
    
    if upload = post_params["photo"] do
      extension = Path.extname(upload.filename)
      File.cp(upload.path, Application.app_dir(:phoenix_blog, "priv/static/images/#{upload.filename}"))
    end
    
    post = Repo.get_by!(Post, slug: id)
    changeset = Post.changeset(post, post_params)

    case Repo.update(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Repo.get_by!(Post, slug: id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: post_path(conn, :index))
  end
end
