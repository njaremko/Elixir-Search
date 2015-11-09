defmodule Search do
  def recursive_search(target \\ "_", path \\ ".") do
    files = elem(File.ls(path), 1)

    Parallel.pmap(files, fn(file) ->
      total_path = path<>"/"<>file
      if File.dir?(total_path) do
        recursive_search(target, total_path)
      else
        if target == "_" do
          IO.puts(total_path)
        end
        if target == file do
          IO.puts(total_path)
        end
      end end)
  end
end

