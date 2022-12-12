defmodule Stack.Server do
  use GenServer

  # External interface

  def start_link(initial_list) do
    GenServer.start_link(__MODULE__, initial_list, name: __MODULE__)
  end

  def pop() do
    GenServer.call(__MODULE__, :pop)
  end

  def push(elem) do
    GenServer.cast(__MODULE__, {:push, elem})
  end

  def peek() do
    GenServer.call(__MODULE__, :peek)
  end

  # GenServer implementation

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
