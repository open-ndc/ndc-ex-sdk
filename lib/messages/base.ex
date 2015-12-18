defmodule Base do
  def build_message(data, config) do
  

    {:Document, nil, [
        {:Name, nil, 'NDC Message'},
        {:MessageVersion_, nil, '1.1.5'},
        {:ReferenceVersion_, nil, '1.0'}
      ]
    } |> XmlBuilder.generate


  end
end
