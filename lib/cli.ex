defmodule CLI do
  def main(args) do
    args |> parse_args |> process
  end

  defp parse_args(args) do
    options = OptionParser.parse(args,
    switches: [name: :string, help: :boolean]
    )

    case options do
      {_, ["."], _} -> :all
      {[recursive: true], _, _} ->  :recursive
      {[name: name], _, _} -> options
      {[help: true], _, _} -> :help
      _ -> IO.puts options
    end
  end

  def process(:all) do
    Search.search
  end

  def process(:recursive) do
    Search.recursive_search
  end

  def process(:help) do
    IO.puts """
    Usage:
    ./search --name file

    Options:
    --name       Specify file name
    --recursive  Do search recursively from current directory
    --help       Show this help message.

    Description:
    Multi-threaded file search
    """

    System.halt(0)
  end

  def process(name) do
    IO.puts "Hello, #{name}! You're awesome!!"
  end
end
