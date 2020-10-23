defmodule Bob do
  def hey(input) do
    cond do
      silent?(input) ->
        "Fine. Be that way!"
      asking?(input) and shouting?(input) ->
        "Calm down, I know what I'm doing!"
      asking?(input) ->
        "Sure."
      shouting?(input) ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end

  defp asking?(statement) do
    statement
    |> String.trim
    |> String.ends_with?("?")
  end

  defp shouting?(statement) do
    statement == String.upcase(statement) and statement != String.downcase(statement)
  end

  defp silent?(statement) do
    "" == statement |> String.trim
  end
end
