defmodule Chain.TransactionPool do
  use GenServer

  require IEx

  def start_link([]) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, []}
  end

  def handle_call(:fetch, _from, transactions) do
    {:reply, transactions, transactions}
  end

  def handle_cast({:add_transaction, transaction}, transactions) do
    {:noreply, [transactions | transaction]}
  end

  def fetch() do
    GenServer.call(__MODULE__, :fetch)
  end

  def add_transaction(transaction) do
    GenServer.cast(__MODULE__, {:add_transaction, transaction})
  end
end
