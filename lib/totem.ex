defmodule Totem do
  use Application

  def start(_type, _args) do
    Totem.Supervisor.start_link
  end
end
