defmodule HostEchoWeb.PageController do
  use HostEchoWeb, :controller
  require Logger

  def index(conn, _params) do
    {:ok, hostname} = :inet.gethostname
    remote_ip = to_string(:inet_parse.ntoa(conn.remote_ip))
    Logger.info("Received request from #{remote_ip}")

    conn
      |> put_status(200)
      |> text("You've hit " <> "#{hostname}" <> "\n")
  end
end
