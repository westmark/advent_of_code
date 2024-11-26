defmodule AdventOfCode.Exercise do
  @moduledoc false
  defmacro __using__(_) do
    file = __CALLER__.file
    data_dir = Path.join((file |> Path.split() |> List.pop_at(-1) |> elem(1)) ++ ["data"])

    quote do
      def data_dir do
        unquote(data_dir)
      end
    end
  end
end
