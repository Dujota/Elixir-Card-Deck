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

    2.) Case Tests
  """

  # What should I Test? -> what behaviour do you really care about inside a module?

  use ExUnit.Case
  doctest Cards

  setup do
    [deck: Cards.create_deck()]
  end

  test "create deck makes 20 cards", %{deck: deck} do
    deck_length = length(deck)
    # pass it any type of expression and it will use that for pass or fail
    assert deck_length == 20
  end

  test "shuffling a deck randomized it", %{deck: deck} do
    # deck = Cards.create_deck()
    # assert deck != Cards.shuffle(deck) <--- same as this statement
    refute deck == Cards.shuffle(deck)
  end

  test "creates a hand the with the correct number of cards" do
    hand_size = 3
    {hand, _rest} = Cards.create_hand(hand_size)
    hand_length = length(hand)
    assert hand_length = hand_size
  end
end
