defmodule CardsTest do
  @doc """
    There 3 distinct type of tests:
    1.) doctest <- tests code examples in doc tags
       - it will look for the patterns of ## Examples
       and then it will run any block of code it sees as the triple tab indentation
       - it will make an assersion  of whatever the iex last line is will equal the value specified in the doc
         IE: iex> hand
         ["Ace of Spades"]
         it will assert hand == ["Ace of Spades"]
  """

  use ExUnit.Case
  doctest Cards
end
