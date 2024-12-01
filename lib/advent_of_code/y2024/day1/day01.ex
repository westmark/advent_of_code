defmodule AdventOfCode.Y2024.Day01 do
  @moduledoc false
  use AdventOfCode.Exercise

  @regex ~r/(\d+)\s+(\d+)/

  def part_1(input) do
    input
    |> read()
    |> sort_and_zip()
    |> Enum.reduce(0, fn {l, r}, acc -> acc + abs(l - r) end)
  end

  def part_2(input) do
    {l, r} = read(input)
    rcounted = Enum.reduce(r, %{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    Enum.reduce(l, 0, fn x, acc -> acc + x * Map.get(rcounted, x, 0) end)
  end

  defp read(input) do
    input
    |> Enum.map(&Regex.scan(@regex, &1))
    |> Enum.map(&List.first/1)
    |> Enum.map(fn [_, l, r] -> {String.to_integer(l), String.to_integer(r)} end)
    |> Enum.reduce({[], []}, fn {l, r}, {acc_l, acc_r} ->
      {[l | acc_l], [r | acc_r]}
    end)
  end

  defp sort_and_zip({l, r}) do
    Enum.zip([Enum.sort(l), Enum.sort(r)])
  end
end
