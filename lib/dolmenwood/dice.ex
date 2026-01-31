defmodule Dolmenwood.Dice do
  def d2, do: Enum.random(1..2)
  def d3, do: Enum.random(1..3)
  def d4, do: Enum.random(1..4)
  def d6, do: Enum.random(1..6)
  def r2d6, do: Enum.random(1..6) + Enum.random(1..6)
  def r3d6, do: Enum.random(1..6) + Enum.random(1..6) + Enum.random(1..6)
  def d8, do: Enum.random(1..8)
  def d10, do: Enum.random(1..10)
  def d12, do: Enum.random(1..12)
  def d20, do: Enum.random(1..20)
  def d100, do: Enum.random(1..100)

  def roll(n, s), do: Enum.sum(1..n |> Enum.map(fn _ -> Enum.random(1..s) end))
end
