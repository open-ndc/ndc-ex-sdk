defmodule RequestTest do
  require Logger
  use ExUnit.Case
  require HTTPotion
  doctest NDCEx

  test "Testing requests" do
    #case HTTPotion.get "http://httpbin.org/ip2" do
      #%HTTPotion.Response{body: body, headers: headers, status_code: 200 } ->
        #IO.inspect body
      #%HTTPotion.Response{status_code: 404} ->
        #IO.puts "Not found :("
      #_ ->
        #IO.inspect "Pattern matching did not worked"
    #end
  end
end
