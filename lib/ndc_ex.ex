defmodule NDCEx do
  require HTTPotion
  require Logger
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

  def get_mix_config(key) when is_atom(key) do
    Application.get_env(:ndc_ex_sdk, key)
  end

  def rest_call_with_message(xml, rest_config) do
    Logger.debug xml

    case HTTPotion.post rest_config[:url], [body: xml, headers: rest_config[:headers]] do
      %HTTPotion.Response{body: body, headers: headers, status_code: 200 } ->
        {:ok, body}
      %HTTPotion.Response{body: body, headers: headers, status_code: status_code } ->
        {:error, body}
      %HTTPotion.Response{status_code: 404} ->
        {:error, "Not found :("}
      _ ->
        {:error, "Pattern matching did not worked"}
    end
  end
end
