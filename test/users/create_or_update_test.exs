defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Juliano",
        email: "julianolorenzato@gmail.com",
        age: 23,
        address: "Blue Street 1932",
        cpf: "32132132100"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Juliano",
        email: "julianolorenzato@gmail.com",
        age: 17, # there are an invalid argument, under 18 yo user
        address: "Blue Street 1932",
        cpf: "32132132100"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid arguments"}

      assert response == expected_response
    end
  end
end
