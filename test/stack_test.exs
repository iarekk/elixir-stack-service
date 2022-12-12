defmodule StackTest do
  use ExUnit.Case
  doctest Stack
  doctest Stack.Impl

  test "greets the world" do
    assert Stack.hello() == :world
  end
end
