defmodule Totem.Mixfile do
  use Mix.Project

  def project do
    [app: :totem,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [
      applications: [
        :logger,
        :cowboy,
        :plug,
        :postgrex,
        :ecto
      ],
      mod: {Totem, []}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 1.1"},
      {:poison, "~> 1.0"}
    ]
  end
end
