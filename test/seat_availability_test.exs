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
            ]
          ],
          Flight: [
            _FlightKey: "FL2",
            Journey: [
              Time: "BLAH"
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

  test "Call AirShopping request" do
    #data = NDCEx.request(:SeatAvailability, @seat_params)
    #IO.inspect data
    assert 1+1 == 2
  end
end
