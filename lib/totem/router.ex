defmodule Totem.Router do
  require IEx
  use Plug.Router

  alias Totem.Message
  alias Totem.Repo

  plug :match
  plug :dispatch

  post "/games" do
    send_resp(conn, 200, "world")
  end

  post "/messages" do
    params = conn.params

    {:ok, msg} = %Message{content: params["content"], player_id: params["player_id"]} |> Repo.insert


    send_resp(conn, 200, Poison.encode!(msg))
  end

  get "/messages" do
    messages = Message
               |> Repo.all
               |> Poison.encode!

    send_resp(conn, 200, messages)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
