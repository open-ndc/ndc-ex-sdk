defmodule NDCEx.Message.SeatAvailabilityRQ do
  import XmlBuilder
  require Logger

  # this is just example of "params" variable. defined for testing purpose
  @query_params [
      Query: [
        OriginDestination: [
          OriginDestinationReferences: "OD1"
        ]
      ],
      DataList: [
        OriginDestinationList: [
          OriginDestination: [
            _OriginDestinationKey: "OD1",
            DepartureCode: "ARN",
            ArrivalCode: "RIX"
          ]
        ],
        FlightList: [
          Flight: [
            _FlightKey: "FL1",
            Journey: [
              Time: "PT6H55M"
            ]
          ]
        ],
        FlightSegmentList: [
          FlightSegment: [
            _SegmentKey: "SEG1",
            Departure: [
              AirportCode: "ARN",
              Date: "2016-05-05",
              Time: "06:00"
            ],
            Arrival: [
              AirportCode: "FRA",
              Date: "2016-05-05",
              Time: "08:10",
              AirportName: "Frankfurt International"
            ],
            MarketingCarrier: [
              AirlineID: "C9",
              Name: "Kronos Air",
              FlightNumber: "809"
            ],
            OperatingCarrier: [
              AirlineID: "C9",
              Name: "Kronos Air",
              FlightNumber: "809"
            ],
            Equipment: [
              AircraftCode: "32A",
              Name: ""
            ],
            ClassOfService: [
              Code: "M"
            ],
            FlightDetail: [
              FlightDuration: [
                Value: "PT2H10M"
              ]
            ],
          ],
          FlightSegment: [
            _SegmentKey: "SEG2",
            Departure: [
              AirportCode: "FRA",
              Date: "2016-05-05",
              Time: "09:50",
              AirportName: "Frankfurt International"
            ],
            Arrival: [
              AirportCode: "RIX",
              Date: "2016-05-05",
              Time: "12:55",
              AirportName: "Riga International"
            ],
            MarketingCarrier: [
              AirlineID: "C9",
              Name: "Kronos Air",
              FlightNumber: "890"
            ],
            OperatingCarrier: [
              AirlineID: "C9",
              Name: "Kronos Air",
              FlightNumber: "890"
            ],
            Equipment: [
              AircraftCode: "321",
              Name: "321 - AIRBUS INDUSTRIE A321 JET"
            ],
            ClassOfService: [
              Code: "M"
            ],
            FlightDetail: [
              FlightDuration: [
                Value: "PT3H5M"
              ]
            ]
          ]
        ]
      ]
    ]

  def yield(params), do: build(params)

  defp build(params) do
    [
      element(:Query, params[:Query]),
      element(:DataList, [
        element(:OriginDestinationList, [
          origin_destination_list(params[:DataList][:OriginDestinationList]),
        ]),
        element(:FlightList, [
          flight_list(params[:DataList][:FlightList]),
        ]),
        element(:FlightSegmentList, [
          flight_segment(params[:DataList][:FlightSegmentList])
        ])
      ])
    ]
  end

  defp query(params) do
    element(:OriginDestination, params[:OriginDestination])
  end

  defp origin_destination_list(params) do
    element(:OriginDestination, %{OriginDestinationKey: params[:OriginDestination][:_OriginDestinationKey]}, [
      element(:DepartureCode, params[:OriginDestination][:DepartureCode]),
      element(:ArrivalCode, params[:OriginDestination][:ArrivalCode])
    ])
  end

  defp flight_list(params) do
    Enum.map(params, fn item ->
      el = elem item, 1
      element(:Flight, %{FlightKey: el[:_FlightKey]}, el)
    end)
  end

  defp flight_segment(params) do
    Enum.map(params, fn item ->
      el = elem item, 1
      element(:FlightSegment, %{SegmentKey: el[:_SegmentKey]}, el)
    end)
  end
end
