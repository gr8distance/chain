defmodule Chain.Server do
  use GenServer

  alias Chain.Block

  require IEx

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    genesis_block = Chain.create_genesis_block()
    {:ok, [genesis_block]}
  end

  def handle_call(:fetch, _from, chain) do
    {:reply, chain, chain}
  end

  def handle_cast({:add, data}, chain) do
    new_chain = Block.add(chain, data)
    {:noreply, new_chain}
  end

  def fetch do
    GenServer.call(__MODULE__, :fetch)
  end

  def add_block(data) do
    GenServer.cast(__MODULE__, {:add, data})
  end
end
