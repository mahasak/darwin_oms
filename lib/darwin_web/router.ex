defmodule DarwinWeb.Router do
  use DarwinWeb, :router
  use Kaffy.Routes, scope: "/admin"

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DarwinWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DarwinWeb do
    pipe_through :browser
    get "/registrations/list", UserController, :index
    resources "/registrations", UserController, only: [:create, :new, :index, :show, :edit, :delete]
    live "/", PageLive, :index
    
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: DarwinWeb.Telemetry
    end
  end
end
