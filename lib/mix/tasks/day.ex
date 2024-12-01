defmodule Mix.Tasks.Day do
  @moduledoc false
  use Mix.Task

  @options [day: :string, part: :string, year: :string, input: :string]

  def run(args) do
    {parsed, _, _} = OptionParser.parse(args, strict: @options)

    if not Keyword.has_key?(parsed, :input) and not Keyword.has_key?(parsed, :part) do
      IO.puts("Missing input file")
      System.halt(1)
    end

    year =
      case Keyword.get(parsed, :year, nil) do
        nil -> to_string(Date.utc_today().year)
        year -> year
      end

    day =
      case Keyword.get(parsed, :day, nil) do
        nil -> to_string(Date.utc_today().day)
        day -> day
      end

    part = Keyword.get(parsed, :part, 1)

    input =
      if Keyword.has_key?(parsed, :input) do
        parsed[:input]
      else
        "input.txt"
      end

    module_name =
      String.to_atom("Elixir.AdventOfCode.Y#{year}.Day#{String.pad_leading(day, 2, "0")}")

    {:module, module} = Code.ensure_loaded(module_name)

    data = AdventOfCode.Helpers.FileLoader.load(input, module)

    module |> apply(:"part_#{part}", [data]) |> IO.inspect()
  end
end
