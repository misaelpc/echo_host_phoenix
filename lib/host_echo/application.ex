defmodule HostEcho.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      # HostEcho.Repo,
      # Start the Telemetry supervisor
      HostEchoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HostEcho.PubSub},
      # Start the Endpoint (http/https)
      HostEchoWeb.Endpoint
      # Start a worker by calling: HostEcho.Worker.start_link(arg)
      # {HostEcho.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HostEcho.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HostEchoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
