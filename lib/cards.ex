defmodule Cards do
  @moduledoc """
  Provides methods for creating and handing a deck of cards
  """

  # a module is a standalone object and it has no idea what an instance variable is ie: no this.cards etc...
  # they are a collection of methods and nothing else at all

  @doc """
  Return a list of string representing playing cards
  """
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

  @doc """
  Determins whether a deck contains a given card

  ## Example
        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true

        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "NOT REAL CARD")
        false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @spec deal(any, integer) :: {list, list}
  @doc """
  Devides a deck into a hand and the remainder of the deck
  The `hand_size` argument indicates how many cards should be in the hand
  ## Examples
        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]

  """
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

  # def load(file_name) do
  #   {status, binary} = File.read(file_name)

  #   # instead of if statements yse switches(case)
  #   case status do
  #     :ok -> :erlang.binary_to_term(binary)
  #     :error -> "That fine does not exist"
  #   end
  # end

  # REFACTORED ABOVE FUNCTION: PATTERN MATCHING ADVANCED!
  def load(file_name) do
    # instead of if statements yse switches(case)

    # in one step we are doing comparing the result of File.read and assigning the second value of the result to a variable
    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      # use underscore _error OR the symbol (atom)
      {:error, _error} -> "That fine does not exist"
    end
  end

  def create_hand(hand_size) do
    # chaining operations  - PIPE OPERATOR
    # Avoid manual calls
    # deck = Cards.create_deck()
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)
    Cards.create_deck()
    # gets deck passed into it automatically
    |> Cards.shuffle()
    # need to pass in any argument that is missing from the prev function return value ie: deal(deck, hand_size)
    |> Cards.deal(hand_size)
  end
end
