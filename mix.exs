defmodule NDCExSdk.Mixfile do
  use Mix.Project

  def project do
    [app: :ndc_ex_sdk,
     version: "0.0.1",
     elixir: "~> 1.2.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     package: [
        maintainers: ["Zaali Kavelashvili"],
        links: %{
          "GitHub" => "https://github.com/open-ndc/ndc-ex-sdk"
        }
      ],
      description: """
          This is an Elixir package that wrapps any NDC-compliant API. It's host-agnostic and quite flexible-through-configuration so that it can reach NDC hosts with a certain flexibility
        """
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpotion]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:xml_builder, "0.0.8"},
      {:pipe, "~> 0.0.2"},
      {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.2"},
      {:httpotion, "~> 2.1.0"},
      {:credo, "~> 0.2", only: [:dev, :test]}
    ]
  end
end
