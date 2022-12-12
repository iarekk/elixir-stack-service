defmodule Stack.Server do
  use GenServer

  alias Stack.Impl

  def init(initial_list) do
    {:ok, initial_list}
  end

  def handle_call(:pop, _from, current_list) do
    {elem, new_list} = Impl.pop(current_list)
    {:reply, elem, new_list}
  end

  def handle_call(:peek, _from, current_list) do
    {elem, new_list} = Impl.peek(current_list)
    {:reply, elem, new_list}
  end

  def handle_cast({:push, elem}, current_list) do
    {:noreply, Impl.push(elem, current_list)}
  end

  def terminate(reason, state) do
    IO.puts("Terminating with reason #{inspect(reason)} and in state #{inspect(state)}")
  end
end

# {:ok, pid} = GenServer.start_link(Stack.Server, [1,2,3])
# {:ok, pid} = GenServer.start_link(Stack.Server, [1,2,3], name: :stacko)
# GenServer.call(:stacko, :peek)
# {:ok, pid} = GenServer.start_link(Stack.Server, [1,2,3], [debug: [:trace, :statistics]])
# GenServer.call(pid, :peek)
# GenServer.call(pid, :pop)
# GenServer.cast(pid, {:push, 200})
# :sys.statistics pid, :get
# iex(1)> Stack.Server.start_link([10,1,2])
# {:ok, #PID<0.163.0>}
# iex(2)> Stack.Server.peek
# 10
# iex(5)> Stack.Server.pop
# 10
# iex(6)> Stack.Server.peek
# 1
# iex(7)> Stack.Server.push 2
# :ok
