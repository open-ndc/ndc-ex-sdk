defmodule NDCEx.Message.FlightPriceRQ do
  import XmlBuilder
  # this is just example of 'params' variable. defined for testing purpose
  @query_params [
        Query: [
          OriginDestination: [
            Flight: [
              Departure: [
                AirportCode: "ARN",
                Date: "2015-12-25",
                Time: "13:20"
              ],
              Arrival: [
                AirportCode: "FRA",
                Date: "2015-12-25",
                Time: "15:30"
              ],
              MarketingCarrier: [
                AirlineID: "9A",
                Name: "Athena Air",
                FlightNumber: "3803"
              ],
              OperatingCarrier: [
                AirlineID: "9A",
                Name: "Athena Air",
                FlightNumber: "3803"
              ],
              Equipment: [
                AircraftCode: "E95",
                Name: "E95 - EMBRAER 195 JET"
              ]
            ]
          ]
        ]
      ]

  def yield(params), do: yield_query(params)

  defp yield_query(params) do
    element(:Query, [
      element(:OriginDestination, [ get_flights(params[:Query][:OriginDestination]) ])
    ])
  end

  defp get_flights(params) do
    Enum.map params, fn item ->
      #this because el is tuple :( I need List to work with
      el = elem item, 1
      element(:Flight, [
        element(:Departure, [
          element(:AirportCode, el[:Departure][:AirportCode]),
          element(:Date, el[:Departure][:Date]),
          element(:Time, el[:Departure][:Time])
        ]),
        element(:Arrival, [
          element(:AirportCode, el[:Arrival][:AirportCode]),
          element(:Date, el[:Arrival][:Date]),
          element(:Time, el[:Arrival][:Time])
        ]),
        element(:MarketingCarrier, [
          element(:AirlineID, el[:MarketingCarrier][:AirlineID]),
          element(:Name, el[:MarketingCarrier][:Name]),
          element(:FlightNumber, el[:MarketingCarrier][:FlightNumber])
        ]),
        element(:OperatingCarrier, [
          element(:AirlineID, el[:OperatingCarrier][:AirlineID]),
          element(:Name, [:OperatingCarrier][:Name]),
          element(:FlightNumber, el[:OperatingCarrier][:FlightNumber])
        ]),
        element(:Equipment, [
          element(:AircraftCode, el[:Equipment][:AircraftCode]),
          element(:Name, el[:Equipment][:Name])
        ])
      ])
    end
  end

end
