defmodule NDCEx.Messages.AirShoppingRQ do
  #alias NDCEx.Base
  import SweetXml

  def yield(doc) do
    #data = 'CoreQuery' |> :xmerl_xpath.string(doc) |> Base.yeild
    doc |> xpath(~x"//CoreQuery/OriginDestinations/OriginDestination"l)

    #doc
    #|> xpath(~x"//CoreQuery"l)
    #|> Enum.map fn (od_node) ->
      #%{
        #departurename: od_node |> xpath(~x"./Departure/AirportCode/text()"),
        #arrival: od_node |> xpath(~x"./Arrival/AirportCode/text()")
      #}
    #end

    doc
    |> xpath(~x"//CoreQuery/OriginDestinations/OriginDestination"l,
      departure: [
        ~x"./Departure",
        airport_code: ~x"./AirportCode/text()",
        date: ~x"./Date/text()"
      ],
      arrival: [
        ~x"./Arrival",
        airport_code: ~x"./AirportCode/text()"
      ],
      marketing_carrier_airline: [
        ~x"./MarketingCarrierAirline",
        airline_id: ~x"./AirlineID/text()",
        name: ~x"./Name/text()"
      ]
    )
  end
end
