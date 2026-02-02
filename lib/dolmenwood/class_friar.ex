defmodule Dolmenwood.Class.Friar do
  alias Dolmenwood.Dice

  @weapon %{
    (1..1) => "Club",
    (2..2) => "Dagger",
    (3..4) => "Sling + 20 stones",
    (5..6) => "Staff"
  }

  @class_items ["Friar's habit", "Wooden holy symbol"]

  def roll_equipment do
    Dolmenwood.CharacterCreation.roll_general_items() ++
      Dolmenwood.CharacterCreation.roll_adventuring_items() ++
      [Dice.roll_table(@weapon, 6)] ++
      @class_items
  end
end
