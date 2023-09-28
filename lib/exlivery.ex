defmodule Exlivery do
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Users
  alias Exlivery.Orders

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: Users.CreateOrUpdate, as: :call
  defdelegate create_or_update_order(params), to: Orders.CreateOrUpdate, as: :call
end
