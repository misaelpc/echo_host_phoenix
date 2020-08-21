defmodule HostEcho.Repo do
  use Ecto.Repo,
    otp_app: :host_echo,
    adapter: Ecto.Adapters.Postgres
end
