defmodule Totem.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/games" do
    send_resp(conn, 200, "world")
  end

  post "/message" do
    send_resp(conn, 200, "world")
  end

  post "/messages" do
    send_resp(conn, 200, "world")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
