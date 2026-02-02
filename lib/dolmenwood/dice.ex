defmodule Dolmenwood.Dice do
  @moduledoc """
  Standard dice set for rolling from iex.
  """

  # Call with d6, d20, etc...
  for sides <- [2, 3, 4, 6, 8, 10, 12, 20, 100] do
    @doc "Rolls a d#{sides}"
    def unquote(:"d#{sides}")(), do: Enum.random(1..unquote(sides))
  end

  @doc """
  Roll one or more dice
  ## Examples

      iex> Dolmenwood.Dice.roll(2, 6) in 2..12
      true

      iex> Dolmenwood.Dice.roll("2d6+3") in 5..15
      true
  """
  def roll(notation) when is_binary(notation) do
    ~r/^(\d+)?d(\d+)([+-]\d+)?$/
    |> Regex.run(notation)
    |> case do
      [_, n, s, mod] -> roll(String.to_integer(n), String.to_integer(s), String.to_integer(mod))
      [_, n, s] -> roll(String.to_integer(n), String.to_integer(s))
      _ -> {:error, :invalid_notation}
    end
  end

  def roll(n, s) when is_integer(n) and is_integer(s) do
    1..n |> Enum.map(fn _ -> Enum.random(1..s) end) |> Enum.sum()
  end

  def roll(n, s, mod) when is_integer(n) and is_integer(s) and is_integer(mod) do
    roll(n, s) + mod
  end

  def roll_table(table, die \\ 100) when is_integer(die) do
    roll = Enum.random(1..die)
    Enum.find_value(table, fn {range, value} -> if roll in range, do: value end)
  end
end
