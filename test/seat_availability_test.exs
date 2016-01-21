defmodule SeatAvailabilityTest do
  require Logger
  use ExUnit.Case
  require HTTPotion
  doctest NDCEx

	@seat_params  [
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
            ],
            SegmentReferences: "SEG1 SEG2"
          ],
          Flight: [
            _FlightKey: "FL2",
            Journey: [
              Time: "PT6H55M"
            ],
            SegmentReferences: "SEG1 SEG2"
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
            ]
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

  test "Call SeatAvialability request" do
    {status, _body} = NDCEx.request(:SeatAvailability, @seat_params)
    Logger.debug _body
    assert status == :ok
  end
end
