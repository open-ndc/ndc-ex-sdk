defmodule NDCEx do
  require HTTPotion
  require Logger
  import SweetXml
  @acceptable_ndc_methods [ AirShopping: ["AirShoppingRQ", "AirShoppingRS"],
                            FlightPrice: ["FlightPriceRQ", "FlightPriceRS"],
                            SeatAvailability: ["SeatAvailabilityRQ", "SeatAvailabilityRS"],
                            ServiceList: ["ServiceListRQ", "ServiceListRS"],
                            ServicePrice: ["ServicePriceRQ", "ServicePriceRS"],

                            OrderCreate: ["OrderCreateRQ", "OrderViewRS"],
                            OrderList: ["OrderListRQ", "OrderListRS"],
                            OrderRetrieve: ["OrderRetrieveRQ", "OrderViewRS"],
                            OrderCancel: ["OrderCancelRQ", "OrderCancelRS"]
                          ]

  def request(method, params) do
    [request_name, response_name] = @acceptable_ndc_methods[method]

    :ndc
    |> get_mix_config
    |> NDCEx.Message.Base.build_document(request_name, params)
    |> rest_call_with_message(get_mix_config(:rest))
  end

  def rest_call_with_message(xml, rest_config) do
    try do
      case HTTPotion.post rest_config[:url], [body: xml, headers: rest_config[:headers]] do
        %HTTPotion.Response{body: body, headers: _headers, status_code: 200 } ->
          {:ok, Exmerl.parse(body)}
        %HTTPotion.Response{body: body, headers: _headers, status_code: _status_code } ->
          {:error, Exmerl.parse(body)}
          apply(NDCEx.Response.Error, :convert, [body])
        %HTTPotion.Response{status_code: 404} ->
          {:error, error_message("Request does not exist")}
        _ ->
          {:error, error_message("Unknown Error")}
      end
    rescue
      e -> {:error, error_message(e.message)}
    end
  end

  defp error_message(message) do
    Exmerl.parse "<error><message>#{message}</message></error>"
  end

  def get_mix_config(key) when is_atom(key) do
    Application.get_env(:ndc_ex_sdk, key)
  end
end
