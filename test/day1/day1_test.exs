defmodule AdventOfCodeDay1Test do
  use ExUnit.Case
  doctest Day1

  test "part 1 example" do
    [left, right] = Day1.getLists("./test/day1/input_example.txt")
    distance = Day1.getTotalDistance(left, right)
    assert distance == 11
  end

  test "part 1 real" do
    [left, right] = Day1.getLists("./test/day1/input.txt")
    distance = Day1.getTotalDistance(left, right)
    IO.puts(Integer.to_string(distance))
  end

  test "part 2 example" do
    [left, right] = Day1.getLists("./test/day1/input_example.txt")

    assert Day1.getTotalSimilarityScore(left, right) === 31
  end

  test "part 2 real" do
    [left, right] = Day1.getLists("./test/day1/input.txt")

    IO.puts(Integer.to_string(Day1.getTotalSimilarityScore(left, right)))
  end
end
