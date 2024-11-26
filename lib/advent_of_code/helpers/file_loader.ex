defmodule AdventOfCode.Helpers.FileLoader do
  @moduledoc false
  def load(file_name_or_path, module) do
    file_path = get_file_path(file_name_or_path, module)

    case Path.extname(file_path) do
      ".txt" -> load_txt(file_path)
      _ -> raise "Unsupported file type"
    end
  end

  defp get_file_path("/" <> _ = file_path, _), do: file_path

  defp get_file_path(file_name, module) do
    Path.join(module.data_dir(), file_name)
  end

  defp load_txt(file_path) do
    file_path
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
  end
end
