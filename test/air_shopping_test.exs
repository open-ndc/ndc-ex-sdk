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
                          Date: "2016-03-01"
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
    {status, _body} = NDCEx.request(:AirShopping, @valid_core_query_params)
		Logger.debug _body
    assert status == :ok
  end

  test "Invalid AirShopping request returns not :ok status" do
    {status, _body} = NDCEx.request(:AirShopping, @invalid_core_query_params)
    assert status == :error
  end

end
