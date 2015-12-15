defmodule Test do
  require Record
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlAttribute, Record.extract(:xmlAttribute, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText,    Record.extract(:xmlText,    from_lib: "xmerl/include/xmerl.hrl")

  def sample do
    "<root><car><make>bmw</make><model>3ser</model></car></root>"
  end

  def run do
    {doc, _} = sample |> String.to_char_list |> :xmerl_scan.string
    car_elements = :xmerl_xpath.string('//car', doc)

    cars = Enum.map(car_elements, fn(car_element) ->
      parse(xmlElement(car_element, :content))
    end)

    IO.puts '========================='
    IO.inspect cars
    IO.puts '========================='

    IO.puts '\n'
    IO.puts '\n'
    IO.puts '\n'
    car = List.first(cars)
    IO.puts '--------------------------'
    IO.puts car.model
    IO.puts '--------------------------'
  end

  def parse(node) do
    cond do
      Record.is_record(node, :xmlElement) ->
        name    = xmlElement(node, :name)
        content = xmlElement(node, :content)
        Map.put(%{}, name, parse(content))

      Record.is_record(node, :xmlText) ->
        xmlText(node, :value) |> to_string

      is_list(node) ->
        case Enum.map(node, &(parse(&1))) do
          [text_content] when is_binary(text_content) ->
            text_content

          elements ->
            Enum.reduce(elements, %{}, fn(x, acc) ->
              if is_map(x) do
                Map.merge(acc, x)
              else
                acc
              end
            end)
        end

      true -> "Not supported to parse #{inspect node}"
    end
  end
end
