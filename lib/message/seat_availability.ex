defmodule NDCEx.Message.SeatAvailabilityRQ do
  import XmlBuilder

  # this is just example of 'params' variable. defined for testing purpose
  @query_params [
        DataList: [
          FlightSegmentList: [
            FlightSegment: [
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
              ],
              ClassOfService: [
                Code: "M"
              ],
              FlightDetail: [
                FlightDuration: [
                  Value: "PT2H10M"
                ]
              ]
            ]
          ],
          FlightList: [
            Flight: [
              FlightKey: "FL1",
              Journey: [
                Time: "PT3H15M"
              ]
            ],
            SegmentReferences: "SEG1 SEG2"
          ],
          OriginDestinationList: [
            OriginDestination: [
              OriginDestinationKey: "OD1"
              DepartureCode: "ARN",
              ArrivalCode: "LHR",
              FlightReferences: "FL1",
            ]
          ]
        ]
      ]

  def yield(params), do: yield_query(params)

  defp yield_core_query(params) do
    element(:Query, [
      element(:OriginDestination, get_flights(params[:Query][:OriginDestination]))
    ])
  end

  defp get_flights(params) do
    Enum.each params, fn el ->
      [
        element(:Flight, [
          element(:Departure, [
            element(:AirportCode, el[:Flight][:Departure][:AirportCode]),
            element(:Date, el[:Flight][:Departure][:Date]),
            element(:Time, el[:Flight][:Departure][:Time])
          ]),
          element(:Arrival, [
            element(:AirportCode, el[:Flight][:Arrival][:AirportCode]),
            element(:Date, el[:Flight][:Arrival][:Date]),
            element(:Time, el[:Flight][:Arrival][:Time])
          ]),
          element(:MarketingCarrier, [
            element(:AirlineID, el[:Flight][:MarketingCarrier][:AirlineID]),
            element(:Name, el[:Flight][:MarketingCarrier][:Name]),
            element(:FlightNumber, el[:Flight][:MarketingCarrier][:FlightNumber])
          ]),
          element(:OperatingCarrier, [
            element(:AirlineID, el[:Flight][:OperatingCarrier][:AirlineID]),
            element(:Name, el[:Flight][:OperatingCarrier][:Name]),
            element(:FlightNumber, el[:Flight][:OperatingCarrier][:FlightNumber])
          ]),
          element(:Equipment, [
            element(:AircraftCode, el[:Flight][:Equipment][:AircraftCode]),
            element(:Name, el[:Flight][:Equipment][:Name])
          ])
        ])
      ]
    end
  end

  def element(fiurst, second) do
    IO.puts ""
  end
end
