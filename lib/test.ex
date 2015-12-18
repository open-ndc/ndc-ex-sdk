defmodule Test do

  def run do
    request_name = 'AirShoppingRQ'
    params = "qwe"

		differ = quote do
			apply( unquote('NDCEx.Message.#{request_name}'), :yield, unquote(params) )
		end
    Code.eval_quoted(differ)
  end

end
