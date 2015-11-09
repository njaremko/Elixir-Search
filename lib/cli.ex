defmodule CLI do
  def main(args) do
    args |> parse_args |> process
  end

  defp parse_args(args) do
    options = OptionParser.parse(args,
    strict: [name: :string, help: :boolean]
    )

    case options do
      {[name: name], _, _} -> options
      {_, ["."], _} -> options
      {[help: true], _, _} -> :help
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    Usage:
    ./search --name file

    Options:
    --name       Specify file name
    --help       Show this help message.

    Description:
    Multi-threaded file search
    """

    System.halt(0)
  end

  def process(options) do
    params = elem(options,0)
    directory = elem(options,1)
    if params[:name] do
      Search.recursive_search(params[:name], List.first(directory))
    else
      Search.recursive_search("_", List.first(directory))
    end
  end

end
