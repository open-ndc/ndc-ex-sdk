defmodule NDCEx.Message.SeatAvailabilityRQ do
  import XmlBuilder
  require Logger

  def yield(params), do: build(params)

  defp build(params) do
    [
      element(:Query, params[:Query]),
      element(:DataList, [
        element(:FlightSegmentList, [
          flight_segment(params[:DataList][:FlightSegmentList])
        ]),
        element(:FlightList, [
          flight_list(params[:DataList][:FlightList]),
        ]),
        element(:OriginDestinationList, [
          origin_destination_list(params[:DataList][:OriginDestinationList]),
        ])
      ])
    ]
  end

  defp query(params) do
    element(:OriginDestination, params[:OriginDestination])
  end

  defp origin_destination_list(params) do
    element(:OriginDestination, %{OriginDestinationKey: params[:OriginDestination][:_OriginDestinationKey]}, [
      element(:DepartureCode, params[:OriginDestination][:DepartureCode]),
      element(:ArrivalCode, params[:OriginDestination][:ArrivalCode])
    ])
  end

  defp flight_list(params) do
    Enum.map(params, fn item ->
      el = elem item, 1
      element(:Flight, %{FlightKey: el[:_FlightKey]}, [
        element(Journey: [
          element(Time: el[:Journey][:Time])
        ]),
        element(SegmentReferences: el[:SegmentReferences])
      ])
    end)
  end

  defp flight_segment(params) do
    Enum.map(params, fn item ->
      el = elem item, 1
      element(:FlightSegment, %{SegmentKey: el[:_SegmentKey]}, [
        element(Departure: el[:Departure]),
        element(Arrival: el[:Arrival]),
        element(MarketingCarrier: el[:MarketingCarrier]),
        element(OperatingCarrier: el[:OperatingCarrier]),
        element(Equipment: el[:Equipment]),
        element(FlightDetail: el[:FlightDetail])
      ])
    end)
  end
end
