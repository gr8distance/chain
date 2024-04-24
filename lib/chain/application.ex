defmodule Chain.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      {Chain.Server, []},
      {Chain.TransactionPool, []}
    ]

    opts = [strategy: :one_for_one, name: Chain.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
