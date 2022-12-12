defmodule Stack.Impl do
  @doc """
    Pops the first element from the list. Returns the element and the remaining elements.

    ## Examples

    iex>Stack.Impl.pop([1, 2, 3])
    {1, [2, 3]}
  """
  def pop(current_list) do
    [elem | tail] = current_list
    {elem, tail}
  end

  @doc """

  Pushes a value into the list.any()

  ## Examples
    iex>Stack.Impl.push(1, [])
    [1]
    iex>Stack.Impl.push(10, [1, 2, 3])
    [10, 1, 2, 3]
  """
  def push(elem, current_list) do
    if(elem < 0) do
      System.halt(elem)
    else
      [elem | current_list]
    end
  end

  @doc """
  Peeks the first element in the list. Returns both the element and the original list.

  ## Examples

  iex> Stack.Impl.peek([1,2,3])
  {1, [1, 2, 3]}
  """
  def peek(current_list) do
    [elem | _] = current_list
    {elem, current_list}
  end
end
