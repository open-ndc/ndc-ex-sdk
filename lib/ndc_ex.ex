defmodule NDCEx do
  require Record
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText,    Record.extract(:xmlText,    from_lib: "xmerl/include/xmerl.hrl")

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
    NDCEx.Messages.AirShoppingRQ.yield_core_query(xml)
  end
end
