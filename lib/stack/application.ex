defmodule Stack.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Stack.Server, [4, 5, 6]}
    ]

    opts = [strategy: :one_for_one, name: Stack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
