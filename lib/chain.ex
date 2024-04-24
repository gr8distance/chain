defmodule Chain do
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

  def validate_chain(chain) do
    # チェーンが有効かどうかを検証するロジック
  end
end
