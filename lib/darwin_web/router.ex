defmodule DarwinWeb.Router do
  use DarwinWeb, :router
  use Kaffy.Routes, scope: "/kaffy"

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

  scope "/admin", DarwinWeb.Admin, as: :admin do
    pipe_through :browser
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DarwinWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      get "/registrations/list", UserController, :index
      resources "/registrations", UserController, only: [:create, :new, :index, :show,  :edit, :delete]
      live_dashboard "/dashboard", metrics: DarwinWeb.Telemetry
    end
  end
end
