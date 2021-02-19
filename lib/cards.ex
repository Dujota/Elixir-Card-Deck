defmodule Cards do
  # a module is a standalone object and it has no idea what an instance variable is ie: no this.cards etc...
  # they are a collection of methods and nothing else at all

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    # List Comprehention -> its like a for loop in elixir
    # It is a mapping a function -> so its always a new array in memory
    for suit <- suits, value <- values do
      # for every element in each list do the block below * the # of lists we pass in.
      # they run at the same time
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    # return two values a deck without the cards dealt AND the hand of cards as a tuple

    Enum.split(deck, hand_size)
    # A tuple is like an array where each index has a very special meaning to me as the developer
  end

  # Pattern matching is elxir's replace of variable assignment
  # hello = "world" <- simple pattern match
  # {hand, rest} = Cards.deal(deck, 5)
  # [first, second] = [1,2]
  # it works exactly like js destructuring
  def save(deck, file_name) do
    # when working with the File System we use erlang code
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end
end
