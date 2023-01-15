defmodule Stack.Application do
  use Application

  def start(_type, initial_stack_value) do
    children = [
      {Stack.Stash, initial_stack_value},
      {Stack.Server, nil}
    ]

    opts = [strategy: :rest_for_one, name: Stack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
