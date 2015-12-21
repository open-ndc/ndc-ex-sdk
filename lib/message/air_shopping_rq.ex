defmodule NDCEx.Message.AirShoppingRQ do
  import XmlBuilder

  def yield(params) do
		yield_core_query(params)
  end

  def yield_core_query(params) do
		element(:CoreQuery, [
			element(:OriginDestinations, [
				element(:OriginDestination, [
					element(:Departure, [
            element(:AirportCode, params[:CoreQuery][:OriginDestinations][:OriginDestination][:Departure][:AirportCode]),
            element(:Date, params[:CoreQuery][:OriginDestinations][:OriginDestination][:Departure][:Date])
						#AirportCode: params[:CoreQuery][:OriginDestinations][:OriginDestination][:Departure][:AirportCode],
						#Date: params[:CoreQuery][:OriginDestinations][:OriginDestination][:Departure][:Date]
          ]),
					element(:Arrival, [
						element(:AirportCode, params[:CoreQuery][:OriginDestinations][:OriginDestination][:Departure][:AirportCode])
          ]),
					element(:MarketingCarrierAirline, [
						element(:AirlineID, "9A"),
						element(:Name, "Athena Air")
          ])
				])
			])
		])
  end

end
