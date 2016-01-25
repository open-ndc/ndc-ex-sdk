defmodule ServiceListTest do
  require Logger
  use ExUnit.Case
  require HTTPotion
  doctest NDCEx
	import SweetXml

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

  test "Call ServiceList request" do
    {_, xml} = NDCEx.request(:AirShopping, @valid_core_query_params)
		response_id = xml |> xpath(~x"//AirShoppingRS/ShoppingResponseIDs/ResponseID/text()")
		params = [
			ShoppingResponseIDs: [
					ResponseID: response_id
				]
			]

		{status, body} = NDCEx.request(:ServiceList, params)
    Logger.debug params
    Logger.debug body
    assert status == :ok
  end
end
