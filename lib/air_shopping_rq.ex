defmodule NDCEx.AirShoppingRQ do
	require Record
	Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
	Record.defrecord :xmlText,    Record.extract(:xmlText,    from_lib: "xmerl/include/xmerl.hrl")
	
	def yield_core_query(xml) do
		# single element
		departure_code  = :xmerl_xpath.string('CoreQuery/OriginDestinations/OriginDestination/Departure/AirportCode', xml)
		departure_date  = :xmerl_xpath.string('CoreQuery/OriginDestinations/OriginDestination/Departure/Date', xml)

		arrival_airport_code  = :xmerl_xpath.string('CoreQuery/OriginDestinations/OriginDestination/Arrival/AirportCode', xml)
		arrival_date  = :xmerl_xpath.string('CoreQuery/OriginDestinations/OriginDestination/Arrival/Date', xml)

		marketing_carrier_airline_id  = :xmerl_xpath.string('CoreQuery/OriginDestinations/OriginDestination/MarketingCarrierAirline/AirlineID', xml)
		marketing_carrier_airline_name  = :xmerl_xpath.string('CoreQuery/OriginDestinations/OriginDestination/MarketingCarrierAirline/Name', xml)
		IO.puts '\n'
		IO.puts '\n'
		IO.puts '\n'
		IO.puts arrival_date
		IO.puts '\n'
		IO.puts '\n'
		IO.puts '\n'
	end
end
