defmodule Base do
  def build_message(data, config) do
  

    {:Document, [
        {:Name, 'NDC Message'},
        {:MessageVersion_, '1.1.5'},
        {:ReferenceVersion_, '1.0'}
      ]
    } |> XmlBuilder.generate
  end
end
