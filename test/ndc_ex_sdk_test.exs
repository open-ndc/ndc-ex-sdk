defmodule NDCExTest do
  require Logger
  use ExUnit.Case
  doctest NDCEx

  @xml "<AirShoppingRQ>\n\t<Document>\n\t\t<Name/>\n\t\t<ReferenceVersion/>\n\t</Document>\n\t<Party>\n\t\t<Sender>\n\t\t\t<TravelAgencySender>\n\t\t\t\t<Contacts>\n\t\t\t\t\t<Contact>\n\t\t\t\t\t\t<EmailContact>\n\t\t\t\t\t\t\t<Address>ndc@usdtravel.com</Address>\n\t\t\t\t\t\t</EmailContact>\n\t\t\t\t\t</Contact>\n\t\t\t\t</Contacts>\n\t\t\t\t<PseudoCity>A4A</PseudoCity>\n\t\t\t\t<IATA_Number>00000001</IATA_Number>\n\t\t\t\t<AgencyID Owner=\"9A\">9A</AgencyID>\n\t\t\t\t<AgentUser>\n\t\t\t\t\t<Name>Travel Wadus</Name>\n\t\t\t\t\t<AgentUserID>travelwadus</AgentUserID>\n\t\t\t\t\t<UserRole>Admin</UserRole>\n\t\t\t\t</AgentUser>\n\t\t\t</TravelAgencySender>\n\t\t</Sender>\n\t</Party>\n\t<CoreQuery>\n\t\t<OriginDestinations>\n\t\t\t<OriginDestination>\n\t\t\t\t<Departure>\n\t\t\t\t\t<AirportCode>MUC</AirportCode>\n\t\t\t\t\t<Date>2016-04-01</Date>\n\t\t\t\t</Departure>\n\t\t\t\t<Arrival>\n\t\t\t\t\t<AirportCode>LHR</AirportCode>\n\t\t\t\t</Arrival>\n\t\t\t\t<MarketingCarrierAirline>\n\t\t\t\t\t<AirlineID>9A</AirlineID>\n\t\t\t\t\t<Name>Athena Air</Name>\n\t\t\t\t</MarketingCarrierAirline>\n\t\t\t</OriginDestination>\n\t\t\t<OriginDestination>\n\t\t\t\t<Departure>\n\t\t\t\t\t<AirportCode>MUC</AirportCode>\n\t\t\t\t\t<Date>2016-04-01</Date>\n\t\t\t\t</Departure>\n\t\t\t\t<Arrival>\n\t\t\t\t\t<AirportCode>LHR</AirportCode>\n\t\t\t\t</Arrival>\n\t\t\t\t<MarketingCarrierAirline>\n\t\t\t\t\t<AirlineID>9A</AirlineID>\n\t\t\t\t\t<Name>Athena Air</Name>\n\t\t\t\t</MarketingCarrierAirline>\n\t\t\t</OriginDestination>\n\t\t</OriginDestinations>\n\t</CoreQuery>\n\t<Parameters>\n\t\t<CurrCodes>\n\t\t\t<CurrCode>EUR</CurrCode>\n\t\t</CurrCodes>\n\t</Parameters>\n\t<Travelers>\n\t\t<Traveler>\n\t\t\t<AnonymousTraveler>\n\t\t\t\t<PTC Quantity=\"1\">ADT</PTC>\n\t\t\t</AnonymousTraveler>\n\t\t</Traveler>\n\t</Travelers>\n\t<Preferences>\n\t\t<Preference>\n\t\t\t<AirlinePreferences>\n\t\t\t\t<Airline>\n\t\t\t\t\t<AirlineID>9A</AirlineID>\n\t\t\t\t</Airline>\n\t\t\t</AirlinePreferences>\n\t\t</Preference>\n\t\t<Preference>\n\t\t\t<CabinPreferences>\n\t\t\t\t<CabinType>\n\t\t\t\t\t<Code>M</Code>\n\t\t\t\t\t<Definition>Economy/coach discounted</Definition>\n\t\t\t\t</CabinType>\n\t\t\t</CabinPreferences>\n\t\t</Preference>\n\t</Preferences>\n</AirShoppingRQ>"
  @query_params [
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

    data = NDCEx.request(:AirShopping, @query_params)
    Logger.debug data
    assert data == @xml
  end
end
