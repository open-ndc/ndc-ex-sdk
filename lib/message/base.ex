defmodule NDCEx.Message.Base do
  import XmlBuilder
  require Logger

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
    element(String.to_atom(request_name), document_attributes(request_name), [
      element(Document: config[:Document]),
      element(Party: [
        element(Sender: party(config[:Party][:Sender]))
      ]),
      element(Parameters: config[:Parameters]),
      element(Travelers: [
        element(Traveler: [
          element(AnonymousTraveler: [
            element(:PTC, %{Quantity: "1"}, "ADT")
          ])
        ])
      ]),
      tag
    ])
  end

  defp party(config) do
    element(TravelAgencySender: [
      element(Name: config[:ORA_Sender][:AgentUser][:Name]),
      element(IATA_Number: config[:ORA_Sender][:AgentUser][:IATA_Number]),
      element(AgencyID: config[:ORA_Sender][:AgentUser][:AgentUserID]),
    ])
  end

  defp metadata do
    element(Other: [
      element(OtherMetadata: [
        element(LanguageMetadatas: [
          element(:LanguageMetadata, %{MetadataKey: "Display"}, [
            element(Application: "Display"),
            element(Code_ISO: "en")
          ])
        ])
      ])
    ])
  end

  defp get_module_name (request_name) do
    Module.concat([NDCEx.Message, request_name])
  end
end
