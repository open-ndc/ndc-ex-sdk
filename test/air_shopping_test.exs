defmodule AirShoppingTest do

  require Logger
  use ExUnit.Case
  require HTTPotion
  doctest NDCEx

  @valid_core_query_params [
                  CoreQuery: [
                    OriginDestinations: [
                      OriginDestination: [
                        Departure: [
                          AirportCode: "SFX",
                          Date: "20:30"
                        ],
                        Arrival: [
                          AirportCode: "MAD"
                        ]
                      ]
                    ]
                  ]
                ]

  @invalid_core_query_params [
                  CoreQuery: [
                    OriginDestinations: [
                      OriginDestination: [
                        Departure: [
                          AirportCode: "SFX"
                        ],
                        Arrival: [
                          AirportCode: "MAD"
                        ]
                      ]
                    ]
                  ]
                ]

  test "Valid AirShopping request returns :ok status" do
    #{status, _body} = NDCEx.request(:AirShopping, @valid_core_query_params)
    #assert status == :ok
  end

  test "Invalid AirShopping request returns not :ok status" do
    #{status, _body} = NDCEx.request(:AirShopping, @invalid_core_query_params)
    #assert status == :error
  end

end
