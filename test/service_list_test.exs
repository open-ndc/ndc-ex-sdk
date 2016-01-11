defmodule ServiceListTest do
  require Logger
  use ExUnit.Case
  require HTTPotion
  doctest NDCEx

  @params [
    ShoppingResponseIDs: [
      ResponseID: "RE6ac7227515a047a581d722971b9fa28f"
      ]
    ]

  test "Call ServiceList request" do
    #data = NDCEx.request(:ServiceList, @params)
    #IO.inspect data
    assert 1+1 == 2
  end
end
