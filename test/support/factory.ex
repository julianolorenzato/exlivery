defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

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
      unit_price: Decimal.new("6.0"),
      quantity: 2
    }
  end

  def order_factory do
    %Order{
      user_cpf: "12345678900",
      delivery_adress: "Kitty Street 8245",
      items: [
        build(:item),
        build(:item,
          description: "Wagyu Beef",
          category: :meats,
          unit_price: Decimal.new("1100.50"),
          quantity: 1
        )
      ],
      total_price: Decimal.new("1112.50")
    }
  end
end
