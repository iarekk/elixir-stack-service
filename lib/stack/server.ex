defmodule Stack.Server do
  use GenServer

  def init(initial_list) do
    {:ok, initial_list}
  end

  def handle_call(:pop, _from, current_list) do
    [elem | tail] = current_list
    {:reply, elem, tail}
  end

  def handle_call(:peek, _from, current_list) do
    [elem | _] = current_list
    {:reply, elem, current_list}
  end

  def handle_cast({:push, elem}, current_list) do
    {:noreply, [elem | current_list]}
  end
end

# {:ok, pid} = GenServer.start_link(Stack.Server, [1,2,3])
# {:ok, pid} = GenServer.start_link(Stack.Server, [1,2,3], [debug: [:trace, :statistics]])
# GenServer.call(pid, :peek)
# GenServer.call(pid, :pop)
# GenServer.cast(pid, {:push, 200})
# :sys.statistics pid, :get
