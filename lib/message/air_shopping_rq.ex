defmodule NDCEx.Message.AirShoppingRQ do
  #alias NDCEx.Base
  #import SweetXml
	import XmlBuilder

  def yield([params, config]) do
		build_document(params, config)
  end
	
	def build_document(params, config) do
		element(:AirShoppingRQ, [
			element(:Document, [
        element(:Name, config[:document][:name]),
        element(:ReferenceVersion, config[:document][:referenceVersion]),
      ]),
			element(:Party, [
        element(:Sender, [ 
          element(:TravelAgencySender, [ 
            element(:Contacts, [ 
              element(:Contact, [ 
                element(:EmailContact, [ 
                  element(:Address, 'ndc@usdtravel.com'),
                ])
              ])
            ]),
            element(:PseudoCity, config[:party][:sender][:oraSender][:agentUser][:pseudoCity]),
            element(:IATA_Number, config[:party][:sender][:oraSender][:agentUser][:iata_Number]),
            element(:AgencyID, %{Owner: "9A"}, "9A"),
            element(:AgentUser, [ 
              element(:Name, config[:party][:sender][:oraSender][:agentUser][:name]),
              element(:Name, config[:party][:sender][:oraSender][:agentUser][:agentUserID]),
              element(:Name, "Admin")
            ]),
          ])
        ]),
        element(:ReferenceVersion, config[:document][:referenceVersion]),
      ])
		]) |> generate
	end

end
