defmodule Dolmenwood.CharacterCreation do
  alias Dolmenwood.Dice

  def roll_ability_scores do
    %{
      "strength" => Dice.roll(3, 6),
      "constitution" => Dice.roll(3, 6),
      "dexterity" => Dice.roll(3, 6),
      "wisdom" => Dice.roll(3, 6),
      "intelligence" => Dice.roll(3, 6),
      "charisma" => Dice.roll(3, 6)
    }
  end
end
