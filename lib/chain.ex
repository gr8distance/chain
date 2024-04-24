defmodule Chain do
  alias Chain.Block

  @moduledoc """
  Documentation for `Chain`.
  """

  def create_genesis_block() do
    new_index = 0
    timestamp = :os.system_time(:millisecond)
    data = "Genesis Block"
    prev_hash = "0"
    Chain.Block.build(new_index, timestamp, data, prev_hash)
  end

  @spec validate([Block.t()]) :: boolean()
  def validate([_genesis_block]), do: true

  def validate([current_block, previous_block | rest]) do
    valid_hash = Block.valid?(current_block, previous_block)
    valid_hash && validate([previous_block | rest])
  end
end
