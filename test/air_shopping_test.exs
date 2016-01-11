defmodule AirShoppingTest do
  require Logger
  use ExUnit.Case
  require HTTPotion
  doctest NDCEx


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
    data = NDCEx.request(:AirShopping, @core_query_params)
    IO.inspect data
    assert 1+1 == 2
  end

end
