defmodule Darwin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Darwin.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Darwin.PubSub}
      # Start a worker by calling: Darwin.Worker.start_link(arg)
      # {Darwin.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Darwin.Supervisor)
  end
end
