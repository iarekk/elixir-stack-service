defmodule Stack.Impl do
  def pop(current_list) do
    [elem | tail] = current_list
    {elem, tail}
  end

  def push(elem, current_list) do
    [elem | current_list]
  end

  def peek(current_list) do
    [elem | _] = current_list
    {elem, current_list}
  end
end
