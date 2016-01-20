defmodule NDCEx.Message.AirShoppingRQ do
  import XmlBuilder

  @doc """
  yield is called by apply function on Message.Base module
  """


  def yield(params), do: params

  defp build(params) do
    element(:CoreQuery, [
      element(:OriginDestinations, [ origin_destinations(params[:CoreQuery][:OriginDestinations]) ])
    ])
    element(Preferences: config[:Preference])
    element(Metadata: metadata)
  end

  defp origin_destinations(params) do
    Enum.map(params, fn el ->
      #this because el is tuple :( I need List to work with
      item = elem el, 1
      element(:OriginDestination, [
        element(:Departure, [
          element(:AirportCode, item[:Departure][:AirportCode]),
          element(:Date, item[:Departure][:Date])
        ]),
        element(:Arrival, [
          element(:AirportCode, item[:Arrival][:AirportCode]),
          element(:Date, item[:Arrival][:Date])
        ]),
        element(:MarketingCarrierAirline, [
          element(:AirlineID, item[:MarketingCarrierAirline][:AirlineID]),
          element(:Name, item[:MarketingCarrierAirline][:Name])
        ])
      ])
    end)
  end
end
