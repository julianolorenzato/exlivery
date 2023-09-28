defmodule Exlivery.Orders.Report do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Order
  alias Exlivery.Orders.Item

  def create(filename \\ "report.csv") do
    order_list = build_order_list()

    File.write(filename, order_list)
  end

  defp build_order_list do
    OrderAgent.list_all()
    |> Map.values()
    |> Enum.map(fn order -> order_string(order) end)
  end

  defp order_string(%Order{user_cpf: cpf, items: items, total_price: total_price}) do
    itens_string = Enum.map(items, &item_string(&1))
    "#{cpf},#{itens_string},#{total_price}\n"
  end

  defp item_string(%Item{category: category, quantity: quantity, unit_price: unit_price}) do
    "#{category},#{quantity},#{unit_price}"
  end
end
