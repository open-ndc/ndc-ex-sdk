defmodule Test do
  #import XmlBuilder

  @query_params [ 
                  CoreQuery: [
                    OriginDestinations: [
                      OriginDestination: [
                        Departure: [
                          AirportCode: 'MUC',
                          Date: '2016-04-01'
                        ],
                        Arrival: [
                          AirportCode: 'LHR'
                        ]
                      ]
                    ]
                  ]
                ]
  def run do
		#{:person, %{id: 12345}, "Josh"} |> XmlBuilder.generate
    #person(123, "Steve", "Jobs") |> generate
    {:person, %{id: 12345}, "Josh"} |> XmlBuilder.generate
  end

  #def person(id, first, last) do
    #element(:person, %{id: id}, "1")
  #end

  #def person(id, first, last) do

    #element(:person, %{id: id}, [
      #element(:first, first)
    #])

  #end

end
