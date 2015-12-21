defmodule NDCEx do
  @acceptable_ndc_methods [ AirShopping: ["AirShoppingRQ", "AirShoppingRS"], 
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
                          AirportCode: "MUC",
                          Date: "2016-04-01"
                        ],
                        Arrival: [
                          AirportCode: "LHR"
                        ]
                      ]
                    ]
                  ]
                ]

  def request(method, params) do
    #for testing purposes params are taken from module attribute defined above
    #params = @query_params
    #method = :AirShopping

    ndc_config = get_mix_config(:ndc)
    [request_name, response_name] = @acceptable_ndc_methods[method]

    NDCEx.Message.Base.build_document(request_name, params, ndc_config)
  end

  def get_mix_config(key) when is_atom(key) do
    Application.get_env(:ndc_ex_sdk, key)
  end
end
