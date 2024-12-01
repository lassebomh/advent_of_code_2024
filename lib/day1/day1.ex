defmodule Day1 do
  @moduledoc """
  https://adventofcode.com/2024/day/1
  """

  def getLists(filename) do
    contents = File.read!(filename)

    split =
      Regex.scan(~r/(\d+)   (\d+)\n/m, contents, [])
      |> Enum.map(&List.to_tuple/1)

    left =
      split
      |> Enum.map(&elem(&1, 1))
      |> Enum.map(&String.to_integer/1)
      |> Enum.sort(:asc)

    right =
      split
      |> Enum.map(&elem(&1, 2))
      |> Enum.map(&String.to_integer/1)
      |> Enum.sort(:asc)

    [left, right]
  end

  def getTotalDistance(left, right) do
    Enum.zip([left, right]) |> Enum.reduce(0, fn {a, b}, acc -> acc + Kernel.abs(a - b) end)
  end

  def getTotalSimilarityScore(left, right) do
    right_freq = Enum.frequencies(right)

    left |> Enum.reduce(0, fn x, acc -> acc + x * Map.get(right_freq, x, 0) end)
  end
end
