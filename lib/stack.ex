defmodule Stack do
  @moduledoc """
  Documentation for `Stack`.
  """
  @server Stack.Server

  @doc """
  Hello world.

  ## Examples

      iex> Stack.hello()
      :world

  """
  def hello do
    :world
  end

  def start_link(initial_list) do
    GenServer.start_link(@server, initial_list, name: @server)
  end

  def pop() do
    GenServer.call(@server, :pop)
  end

  def push(elem) do
    GenServer.cast(@server, {:push, elem})
  end

  def peek() do
    GenServer.call(@server, :peek)
  end
end

# iex(1)> Stack.start_link [1,2,3]
# {:ok, #PID<0.174.0>}
# iex(2)> Stack.peek
# 1
# iex(3)> Stack.push 5
# :ok
# iex(4)> Stack.pop
# 5
# iex(5)> Stack.pop
# 1
# iex(6)> Stack.peek
# 2
# iex(7)>
