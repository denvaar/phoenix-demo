defmodule PhoenixBlog.Router do
  use PhoenixBlog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug PhoenixBlog.CurrentUser
  end

  scope "/", PhoenixBlog do
    pipe_through [:browser, :browser_auth]

    get "/", PageController, :index
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/posts", PostController
  end

  scope "/api", PhoenixBlog do
    pipe_through :api

    patch "/posts/:id/like", PostController, :like_post
  end
end
