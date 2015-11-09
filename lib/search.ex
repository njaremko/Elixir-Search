defmodule Search do
  def search() do
    files = elem(File.ls, 1)
    Enum.map(files, fn(file) -> IO.puts file end)
  end

  def recursive_search(path \\ ".") do
    files = elem(File.ls(path), 1)
    Parallel.pmap(files, fn(file) ->
      if File.dir?(path<>"/"<>file) do
        recursive_search(path<>"/"<>file<>"/")
      else
        IO.puts file
      end end)
  end
end

