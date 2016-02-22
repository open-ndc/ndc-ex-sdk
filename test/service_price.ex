defmodule ServiceListTest do
  require Logger
  require Record
  use ExUnit.Case
  doctest NDCEx
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  @valid_core_query_params [
                  CoreQuery: [
                    OriginDestinations: [
                      OriginDestination: [
                        Departure: [
                          AirportCode: "SXF",
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
    [element] = :xmerl_xpath.string('/AirShoppingRS/ShoppingResponseIDs/ResponseID', xml)
    [text] = xmlElement(element, :content)
    response_id = xmlText(text, :value)
		params = [
			ShoppingResponseIDs: [
					ResponseID: to_string(response_id)
				]
			]

		{status, body} = NDCEx.request(:ServicePrice, params)
    IO.inspect status
    IO.inspect body
    assert status == :ok
  end
end
