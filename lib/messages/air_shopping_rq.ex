defmodule NDCEx.Messages.AirShoppingRQ do
  alias NDCEx.Base
	
  def yield_core_query(doc) do
    'CoreQuery' |> :xmerl_xpath.string(doc) |> Base.yeild
  end
end
