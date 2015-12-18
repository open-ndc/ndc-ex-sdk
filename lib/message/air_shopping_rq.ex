defmodule NDCEx.Message.AirShoppingRQ do
  #alias NDCEx.Base
  #import SweetXml
	import XmlBuilder

  def yield(config) do
		build_document(config) |> generate
  end
	
	def build_document(config) do
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
              element(:AgentUserID, config[:party][:sender][:oraSender][:agentUser][:agentUserID]),
              element(:UserRole, "Admin")
            ])
          ])
        ])
      ])
		])
	end

end
