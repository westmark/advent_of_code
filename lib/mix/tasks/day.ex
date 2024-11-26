defmodule Mix.Tasks.Day do
  @moduledoc false
  use Mix.Task

  @options [day: :string, part: :string, year: :string, input: :string]

  def run(args) do
    {parsed, _, invalid} = OptionParser.parse(args, strict: @options)

    if :input in invalid do
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
    input = parsed[:input]

    module_name =
      String.to_atom("Elixir.AdventOfCode.Y#{year}.Day#{String.pad_leading(day, 2, "0")}")

    {:module, module} = Code.ensure_loaded(module_name)

    data = AdventOfCode.Helpers.FileLoader.load(input, module)

    apply(module, :"part_#{part}", [data])
  end
end
