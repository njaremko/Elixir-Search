defmodule Search do
  def search() do
    files = elem(File.ls, 1)
    Enum.map(files, fn(file) -> IO.puts file end)
  end

  def recursive_search(path \\ ".", me \\ self) do

    files = elem(File.ls(path), 1)
    Enum.map(files, fn(file) ->
      if File.dir?(path<>"/"<>file) do
        spawn(Search, :recursive_search, [path<>"/"<>file<>"/", me])
      else
        send me, {file}
      end end)
  end

  def test(first \\ true, me \\ self) do
    if first == true do
      me = spawn(Search, :r_search, [])
      two = spawn(Search, :recursive_search, [".", me])
      first = false
    end
    if Process.alive?(me) == false do
      System.halt(0)
    end
    test(false, me)
  end

  def r_search do
    receive do
      {msg} -> IO.puts msg
      r_search
    after
      1_000 -> "test"
    end
  end
end

