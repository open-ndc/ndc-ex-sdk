defmodule Test do
  import XmlBuilder

  def run do
    [person("Steve", "Jobs"), person("Steve", "Wozniak")] |> generate
  end

  def person(first, last) do
    element(:person, [
      element(:first, first),
      element(:last, last)
    ])
  end

end
