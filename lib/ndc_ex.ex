defmodule NDCEx do
  @acceptable_ndc_methods [ AirShopping: ["AirShoppingRQ", 'AirShoppingRS'], 
                            FlightPrice: ['FlightPriceRQ', 'FlightPriceRS'],
                            SeatAvailability: ['SeatAvailabilityRQ', 'SeatAvailabilityRS'],
                            ServiceList: ['ServiceListRQ', 'ServiceListRS'],
                            ServicePrice: ['ServicePriceRQ', 'ServicePriceRS'],

                            OrderCreate: ['OrderCreateRQ', 'OrderViewRS'],
                            OrderList: ['OrderListRQ', 'OrderListRS'],
                            OrderRetrieve: ['OrderRetrieveRQ', 'OrderViewRS'],
                            OrderCancel: ['OrderCancelRQ', 'OrderCancelRS']
                          ]
  @query_params [ 
                  CoreQuery: [
                    OriginDestinations: [
                      OriginDestination: [
                        Departure: [
                          AirportCode: 'MUC',
                          Date: '2016-04-01'
                        ],
                        Arrival: [
                          AirportCode: 'LHR'
                        ]
                      ]
                    ]
                  ]
                ]

  def request(method, params) when is_atom(method) do
    #for testing purposes params are taken from module attribute defuned abowe
    params = @query_params

    ndc_config = get_mix_config(:ndc)
		IO.inspect ndc_config
    [request_name, response_name] = @acceptable_ndc_methods[method]
		apply(Module.concat([NDCEx.Message, request_name]), :yield, params )
  end

  def get_mix_config(key) when is_atom(key) do
    Application.get_env(:ndc_ex_sdk, key)
  end

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
    xml
    |> NDCEx.Messages.AirShoppingRQ.yield_core_query
    |> IO.inspect
  end
end
