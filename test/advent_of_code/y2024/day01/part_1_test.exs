defmodule AdventOfCode.Y2024.Day01.Part1Test do
  use ExUnit.Case

  alias AdventOfCode.Y2024.Day01

  test "part 1" do
    input = "y2024-day01-part01.txt"
    data = AdventOfCode.Helpers.FileLoader.load(input, Day01)
    assert Day01.part_1(data) == "test"
  end
end
