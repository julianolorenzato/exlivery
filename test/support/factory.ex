defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  def user_factory do
    %User{
      name: "Juliano",
      email: "julianolorenzato@gmail.com",
      age: 23,
      cpf: "12345678900",
      address: "Kitty Street 8245"
    }
  end

  def item_factory do
    %Item{
      description: "Orange Juice",
      category: :drinks,
      unit_price: Decimal.new("9.5"),
      quantity: 2
    }
  end
end
