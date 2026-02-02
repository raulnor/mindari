defmodule Dolmenwood.Class.Hunter do
  alias Dolmenwood.Dice

  @armour %{
    (1..3) => "Leather armour",
    (4..6) => "Leather armour + shield"
  }

  @weapon %{
    (1..1) => "Dagger",
    (2..2) => "Longsword",
    (3..4) => "Longbow + 20 arrows",
    (5..5) => "Shortsword",
    (6..6) => "Sling + 20 stones"
  }

  @class_items []

  def roll_equipment(size \\ :medium) do
    Dolmenwood.CharacterCreation.roll_general_items() ++
      Dolmenwood.CharacterCreation.roll_adventuring_items() ++
      [Dice.roll_table(@armour, 6)] ++
      [roll_weapon(size)] ++
      [roll_weapon(size)] ++
      @class_items
  end

  defp roll_weapon(size) do
    Dice.roll_table(@weapon, 6)
    |> maybe_swap_bow(size)
  end

  defp maybe_swap_bow("Longbow + 20 arrows", :small), do: "Shortbow + 20 arrows"
  defp maybe_swap_bow(weapon, _size), do: weapon
end
