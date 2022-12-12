defmodule Stack.Server do
  use GenServer

  def init(initial_list) do
    {:ok, initial_list}
  end

  def handle_call(:pop, _from, current_list) do
    [elem | tail] = current_list
    {:reply, elem, tail}
  end
end
