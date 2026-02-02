defmodule Dolmenwood.Class.Cleric do
  @armour [
    "Leather",
    "Leather + shield",
    "Chainmail",
    "Chainmail + shield",
    "Plate mail",
    "Plate mail + shield"
  ]

  @weapons [
    "Dagger",
    "Longsword",
    "Mace",
    "Shortbow + 20 arrows",
    "Shortsword",
    "Warhammer"
  ]

  @class_items ["Wooden holy symbol"]

  def roll_equipment do
    Dolmenwood.CharacterCreation.roll_general_items() ++
      Dolmenwood.CharacterCreation.roll_adventuring_items() ++
      [Enum.random(@armour)] ++
      [Enum.random(@weapons)] ++
      [Enum.random(@weapons)] ++
      @class_items
  end
end
