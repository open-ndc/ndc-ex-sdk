defmodule NDCEx.Message.Base do
  #import XmlBuilder

  def build_document(request_name, params, config) do
    data = request_name
    |> get_module_name
    |> apply(:yield, [params])
    #|> build config

    #generate(data)
  end

  #defp build(tag, config) do
		#element(:AirShoppingRQ, [
			#element(:Document, nil,
			 #Name: config[:Document][:Name],
			 #ReferenceVersion: config[:Document][:ReferenceVersion]
			#),
			#element(:Party, [
				#element(:Sender, [
					#element(:TravelAgencySender, [
						#element(:Contacts, nil, [
							#element(:Contact, [
								#element(:EmailContact, [
									#element(:Address, "ndc@usdtravel.com"),
								#])
							#])
						#]),
						#element(:PseudoCity, config[:party][:sender][:oraSender][:agentUser][:pseudoCity]),
						#element(:IATA_Number, config[:party][:sender][:oraSender][:agentUser][:iata_Number]),
						#element(:AgencyID, %{Owner: "9A"}, "9A"),
						#element(:AgentUser, [
							#element(:Name, config[:party][:sender][:oraSender][:agentUser][:name]),
							#element(:AgentUserID, config[:party][:sender][:oraSender][:agentUser][:agentUserID]),
							#element(:UserRole, "Admin")
						#])
					#])
				#])
			#]),
			#tag,
      #element(:Parameters, [
        #element(:CurrCodes, [
          #element(:CurrCode, "EUR")
        #])
      #]),
      #element(:Travelers, [
        #element(:Traveler, [
          #element(:AnonymousTraveler, [
            #element(:PTC, %{Quantity: "1"}, "ADT")
          #])
        #])
      #]),
      #element(:Preferences, [
        #element(:Preference, [
          #element(:AirlinePreferences, [
            #element(:Airline, [
              #element(:AirlineID, "9A")
            #])
          #])
        #]),
        #element(:Preference, [
          #element(:CabinPreferences, [
            #element(:CabinType, [
              #element(:Code, "M"),
              #element(:Definition, "Economy/coach discounted"),
            #])
          #])
        #])
      #])
		#])
  #end

  defp get_module_name (request_name) do
    Module.concat([NDCEx.Message, request_name])
  end
end
