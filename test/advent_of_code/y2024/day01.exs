defmodule AdventOfCode.Y2024.Day01Test do
  @moduledoc false
  use ExUnit.Case

  alias AdventOfCode.Helpers.FileLoader
  alias AdventOfCode.Y2024.Day01

  test "part 1" do
    input = "test.txt"
    data = FileLoader.load(input, Day01)
    assert Day01.part_1(data) == 11
  end

  test "part 2" do
    input = "test.txt"
    data = FileLoader.load(input, Day01)
    assert Day01.part_2(data) == 31
  end
end
