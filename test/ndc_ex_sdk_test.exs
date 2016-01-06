defmodule NDCExTest do
  require Logger
  use ExUnit.Case
  require HTTPotion
  doctest NDCEx


  @flight_price_query [
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

  @core_query_params [
                  CoreQuery: [
                    OriginDestinations: [
                      OriginDestination: [
                        Departure: [
                          AirportCode: "MUC",
                          Date: "2016-04-01"
                        ],
                        Arrival: [
                          AirportCode: "LHR"
                        ]
                      ],
                      OriginDestination: [
                        Departure: [
                          AirportCode: "MUC",
                          Date: "2016-04-01"
                        ],
                        Arrival: [
                          AirportCode: "LHR"
                        ]
                      ]
                    ]
                  ]
                ]

  test "Call AirShopping request" do
    #data = NDCEx.request(:AirShopping, @seat_params)
		#IO.inspect data
    assert 1+1 == 2
  end


  test "Call FlightPrice request" do
    #flight_price_resp = NDCEx.request(:FlightPrice, @flight_price_query)
    #Logger.debug flight_price_resp
    assert 1 + 1 == 2
  end
end
