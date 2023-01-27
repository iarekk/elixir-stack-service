defmodule Stack.Stash do
  use Agent

  @me __MODULE__

  def start_link(initial_list) do
    Agent.start_link(fn -> initial_list end, name: @me)
  end

  def get() do
    Agent.get(@me, fn st -> st end)
  end

  def update(new_list) do
    Agent.update(@me, fn _ -> new_list end)
  end
end
