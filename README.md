# NDC Elixir SDK

This is an Elixir package that wrapps any NDC-compliant API.
It's host-agnostic and quite flexible-through-configuration so that it can reach NDC hosts with a certain flexibility.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add ndc_ex_sdk to your list of dependencies in `mix.exs`:

        def deps do
          [{:ndc_ex_sdk, "~> 0.0.1"}]
        end

  2. Ensure ndc_ex_sdk is started before your application:

        def application do
          [applications: [:ndc_ex_sdk]]
        end
