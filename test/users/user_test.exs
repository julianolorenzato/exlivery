defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build("Juliano", "julianolorenzato@gmail.com", "12345678900", 23, "Kitty Street 8245")

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end
  end

  test "when there are invalid arguments, returns an error" do
    response =
      User.build("Juliano", "julianolorenzato@gmail.com", 12345678900, 17, "Kitty Street")

    expected_response = {:error, "Invalid arguments"}

    assert response == expected_response
  end
end
