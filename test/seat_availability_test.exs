defmodule SeatAvailabilityTest do
  require Logger
  use ExUnit.Case
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
            DepartureCode: "SXF",
            ArrivalCode: "MAD"
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
              AirportCode: "SXF",
              Date: "2016-03-01",
              Time: "12:00"
            ],
            Arrival: [
              AirportCode: "FRA",
              Date: "2016-03-01",
              Time: "13:10",
              AirportName: "Frankfurt International Airport"
            ],
            MarketingCarrier: [
              AirlineID: "FA",
              Name: "Kronos Air",
              FlightNumber: "809"
            ],
            OperatingCarrier: [
              AirlineID: "FA",
              Name: "Kronos Air",
              FlightNumber: "809"
            ],
            Equipment: [
              AircraftCode: "31F",
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
          ],
          FlightSegment: [
            _SegmentKey: "SEG2",
            Departure: [
              AirportCode: "FRA",
              Date: "2016-03-01",
              Time: "14:00",
              AirportName: "Frankfurt International Airport"
            ],
            Arrival: [
              AirportCode: "MAD",
              Date: "2016-03-01",
              Time: "16:35",
              AirportName: "Madrid Adolfo Suárez International Airport"
            ],
            MarketingCarrier: [
              AirlineID: "FA",
              Name: "Kronos Air",
              FlightNumber: "890"
            ],
            OperatingCarrier: [
              AirlineID: "FA",
              Name: "Kronos Air",
              FlightNumber: "890"
            ],
            Equipment: [
              AircraftCode: "31F",
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
    IO.inspect _body
    assert status == :ok
  end
end
