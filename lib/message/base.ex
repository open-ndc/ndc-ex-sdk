defmodule NDCEx.Message.Base do
  import XmlBuilder

  def build_document(config, request_name, params) do
    request_name
    |> get_module_name
    |> apply(:yield, [params])
    |> build(request_name, config)
    |> doc
  end

  defp document_attributes(request_name) do
    %{
      "xmlns" => "http://www.iata.org/IATA/EDIST",
      "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
      "xsi:schemaLocation" => "http://www.iata.org/IATA/EDIST ../#{request_name}.xsd",
      "Version" => "15.2"
    }
  end

  defp build(tag, request_name, config) do
    IO.inspect request_name
    element(String.to_atom(request_name), document_attributes(request_name) , [
      element(:Document, nil,
       Name: config[:document][:name],
       ReferenceVersion: config[:document][:referenceVersion]
      ),
      element(:Party, [
        element(:Sender, [
          element(:TravelAgencySender, [
            element(:Contacts, [
              element(:Contact, [
                element(:EmailContact, [
                  element(:Address, "ndc@usdtravel.com"),
                ])
              ])
            ]),
            element(:PseudoCity, config[:party][:sender][:oraSender][:agentUser][:pseudoCity]),
            element(:IATA_Number, config[:party][:sender][:oraSender][:agentUser][:iata_Number]),
            element(:AgencyID, %{Owner: "9A"}, "9A"),
            element(:AgentUser, [
              element(:Name, config[:party][:sender][:oraSender][:agentUser][:name]),
              element(:AgentUserID, config[:party][:sender][:oraSender][:agentUser][:agentUserID]),
              element(:UserRole, "Admin")
            ])
          ])
        ])
      ]),
      element(:Parameters, [
        element(:CurrCodes, [
          element(:CurrCode, "EUR")
        ])
      ]),
      element(:Travelers, [
        element(:Traveler, [
          element(:AnonymousTraveler, [
            element(:PTC, %{Quantity: "1"}, "ADT")
          ])
        ])
      ]),
      tag,
      element(:Preferences, [
        element(:Preference, [
          element(:AirlinePreferences, [
            element(:Airline, [
              element(:AirlineID, "9A")
            ])
          ])
        ]),
        element(:Preference, [
          element(:CabinPreferences, [
            element(:CabinType, [
              element(:Code, "M"),
              element(:Definition, "Economy/coach discounted"),
            ])
          ])
        ])
      ])
    ])
  end

  defp get_preferences(params) do
    Enum.map(params, fn el ->
      #this because el is tuple :( I need List to work with
      item = elem el, 1
      element(:Preference, [
        element(:AirlinePreferences, [
          element(:Airline, [
            element(:AirlineID, params[:Preference][:AirlineID])
          ])
        ])
      ])
    end)
  end

  defp get_travalers(params) do
    Enum.map(params, fn el ->
      #this because el is tuple :( I need List to work with
      item = elem el, 1
      element(:Traveler, [
        element(:AnonymousTraveler, [
          element(:PTC, %{Quantity: params[:Traveler][:Quantity]}, params[:Traveler][:PTC])
        ])
      ])
    end)
  end

  defp get_module_name (request_name) do
    Module.concat([NDCEx.Message, request_name])
  end
end
