defmodule NDCEx do

  def parse do
    file_name = 'requests/Athena/OneWay/AirShoppingRQ - ARN-LHR OneWay with one pax.xml'
    File.read!(file_name)
      |> scan_text
      |> parse_xml
  end

  def scan_text(file_content) do
    :xmerl_scan.string(String.to_char_list(file_content))
  end

  def parse_xml({xml, _}) do
    data = NDCEx.Messages.AirShoppingRQ.yield_core_query(xml)
    IO.inspect data
  end
end
