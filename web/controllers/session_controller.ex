defmodule PhoenixBlog.SessionController do
  use PhoenixBlog.Web, :controller
  
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  alias PhoenixBlog.User

  plug :scrub_params, "session" when action in ~w(create)a

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"name" => name,
                                    "password" => password}}) do
    user = Repo.get_by(User, name: name || "")
    
    result = cond do
      user && checkpw(password || "", user.password_hash) ->
        {:ok, login(conn, user)}
      user ->
        {:error, :unauthorized, conn}
      true ->
        {:error, :not_found, conn}
    end

    case result do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Login Successful")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid login attempt")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> logout
    |> put_flash(:info, "Logout successful")
    |> redirect(to: page_path(conn, :index))
  end
  
  def unauthenticated(conn, params) do
    conn
    |> render(PhoenixBlog.ErrorView, :"401")
    |> put_status(401)
  end

  defp logout(conn) do
    Guardian.Plug.sign_out(conn)
  end

  defp login(conn, user) do
    conn |> Guardian.Plug.sign_in(user)
  end

end
