defmodule Dolmenwood.Class.Bard do
  alias Dolmenwood.Dice

  @armour %{
    (1..2) => "None",
    (3..4) => "Leather armour",
    (5..6) => "Chainmail"
  }

  @weapon %{
    (1..1) => "Club",
    (2..2) => "3 daggers",
    (3..3) => "Longsword",
    (4..4) => "Sling + 20 stones",
    (5..5) => "Shortbow + 20 arrows",
    (6..6) => "Shortsword"
  }

  @instruments ["Stringed instrument", "Wind instrument"]

  @class_items []

  def roll_equipment do
    Dolmenwood.CharacterCreation.roll_general_items() ++
      Dolmenwood.CharacterCreation.roll_adventuring_items() ++
      [Dice.roll_table(@armour, 6)] ++
      [Dice.roll_table(@weapon, 6)] ++
      [Dice.roll_table(@weapon, 6)] ++
      [Enum.random(@instruments)] ++
      @class_items
  end
end
