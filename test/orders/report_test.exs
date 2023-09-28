defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build
      |> OrderAgent.save()

      :order
      |> build
      |> OrderAgent.save()

      expected_response =
        "12345678900,drinks,2,6.0meats,1,1100.50,1112.50\n" <>
          "12345678900,drinks,2,6.0meats,1,1100.50,1112.50\n"

      filename = "report_test.csv"
      Report.create(filename)

      response = File.read!(filename)

      assert response == expected_response
    end
  end
end
