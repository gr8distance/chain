defmodule Chain.Block do
  defstruct index: 0, timestamp: nil, data: nil, prev_hash: "", hash: ""

  def add(chain, data) do
    last_block = List.last(chain)
    new_index = last_block.index + 1
    timestamp = :os.system_time(:millisecond)
    prev_hash = last_block.hash
    new_block = build(new_index, timestamp, data, prev_hash)
    chain ++ [new_block]
  end

  def build(new_index, timestamp, data, prev_hash) do
    %__MODULE__{
      index: new_index,
      timestamp: timestamp,
      data: data,
      prev_hash: prev_hash,
      hash: compute_hash(new_index, timestamp, data, prev_hash)
    }
  end

  require IEx

  defp compute_hash(index, timestamp, data, prev_hash) do
    [index, timestamp, data, prev_hash]
    |> Enum.join()
    |> to_hash()
    |> Base.encode16(case: :lower)
  end

  defp to_hash(str), do: :crypto.hash(:sha256, str)
end

defimpl String.Chars, for: Map do
  def to_string(map) do
    Jason.encode!(map)
  end
end
