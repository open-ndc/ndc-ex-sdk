defmodule NDCEx.Message.AirShoppingRQ do
  #import XmlBuilder
  #@query_params [ 
                  #CoreQuery: [
                    #OriginDestinations: [
                      #OriginDestination: [
                        #Departure: [
                          #AirportCode: "MUC",
                          #Date: "2016-04-01"
                        #],
                        #Arrival: [
                          #AirportCode: "LHR"
                        #]
                      #]
                    #]
                  #]
                #]

  def yield(params) do
    #yield_core_query(params)
    extract_params(params)
  end

  def get_origin_destinations(params) do
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

  def yield_core_query(params) do
    element(:CoreQuery, [
      element(:OriginDestinations, get_origin_destinations(params[:CoreQuery][:OriginDestinations]))
    ])
  end

end
