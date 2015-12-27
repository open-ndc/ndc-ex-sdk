defmodule NDCEx.Message.AirShoppingRQ do
  import XmlBuilder

  @doc """
  yield is called by apply function on Message.Base module
  """


  def yield(params), do: yield_core_query(params)

  defp yield_core_query(params) do
    element(:CoreQuery, [
      element(:OriginDestinations, origin_destinations(params[:CoreQuery][:OriginDestinations]))
    ])
  end

  defp origin_destinations(params) do
    Enum.each params, fn el ->
      [
        element(:OriginDestination, [
          element(:Departure, [
            element(:AirportCode, el[:OriginDestination][:Departure][:AirportCode]),
            element(:Date, el[:OriginDestination][:Departure][:Date])
          ]),
          element(:Arrival, [
            element(:AirportCode, el[:OriginDestination][:Departure][:AirportCode])
          ]),
          element(:MarketingCarrierAirline, [
            element(:AirlineID, "9A"),
            element(:Name, "Athena Air")
          ])
        ])
      ]
    end
  end
end
