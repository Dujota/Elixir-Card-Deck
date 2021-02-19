defmodule Cards do
  # a module is a standalone object and it has no idea what an instance variable is ie: no this.cards etc...
  # they are a collection of methods and nothing else at all

  def create_deck do
    ["Ace", "Two", "Three"]
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
