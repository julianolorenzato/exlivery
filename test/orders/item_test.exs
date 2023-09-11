defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, returns an item" do
      response = Item.build("Orange Juice", :drinks, 6.0, 2)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an error" do
      response = Item.build("Orange Juice", :non_existent_category, 6.0, 2)

      expected_response = {:error, "Invalid arguments"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns an error" do
      response = Item.build("Orange Juice", :drinks, "is not a price", 2)

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns an error" do
      response = Item.build("Orange Juice", :drinks, 6.0, 0)

      expected_response = {:error, "Invalid arguments"}

      assert response == expected_response
    end
  end
end
