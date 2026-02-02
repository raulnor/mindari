defmodule Dolmenwood.CharacterCreation do
  alias Dolmenwood.Dice

  @adventuring_items [
    "Bedroll",
    "Chalk (10 sticks)",
    "Chisel",
    "Cooking pots",
    "Crowbar",
    "Firewood (bundle)",
    "Grappling hook",
    "Ink, quill, 5 sheets paper",
    "Iron spikes (12)",
    "Lantern (hooded)",
    "Marbles (bag of 20)",
    "Oil flask",
    "Rope (50')",
    "Sack",
    "Shovel",
    "Sledgehammer",
    "Small hammer",
    "Tent",
    "Torches (3)",
    "Twine (100' ball)"
  ]

  @general_items [
    "Common clothes",
    "Backpack",
    "2 preserved rations",
    "Waterskin",
    "Tinder box",
    "Belt pouch"
  ]

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

  def format_ability_scores(scores) do
    ~w(strength constitution dexterity wisdom intelligence charisma)
    |> Enum.map_join(" ", fn attr ->
      abbrev = attr |> String.upcase() |> String.slice(0, 3)
      "#{abbrev} #{scores[attr]}"
    end)
  end

  def roll_adventuring_items(count \\ 4) do
    1..count |> Enum.map(fn _ -> Enum.random(@adventuring_items) end)
  end

  def roll_general_items do
    @general_items ++ ["#{Dice.roll(3, 6)} gold pieces"]
  end
end
