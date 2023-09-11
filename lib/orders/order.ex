defmodule Exlivery.Orders.Order do
  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  @keys [:user_cpf, :delivery_adress, :items, :total_price]
  @enforce_keys @keys

  defstruct @keys

  def build(%User{cpf: cpf, address: address}, [%Item{} | _rest] = items) do
    {:ok,
     %__MODULE__{
       user_cpf: cpf,
       delivery_adress: address,
       items: items,
       total_price: calculate_total_price(items)
     }}
  end

  def build(_user, _items), do: {:error, "Invalid arguments"}

  defp calculate_total_price(items) when is_list(items) do
    Enum.reduce(items, Decimal.new("0.00"), &sum_prices(&1, &2))
  end

  defp sum_prices(%Item{unit_price: price, quantity: quantity}, acc) do
    Decimal.mult(price, quantity)
    |> Decimal.add(acc)
  end
end
