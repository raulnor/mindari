defmodule Dolmenwood.Kindred.Breggle do
  alias Dolmenwood.Dice

  @male ~w(Aele Braembel Broob Crump Drerdl Frennig Grerg Gripe Llerg Llrod Lope Mashker Olledg Rheg Shadgore Shadwell Shadwicke Shandor Shank Snerd)

  @female ~w(Aedel Berrild Bredhr Draed Fannigrew Frandorup Grendilore Grendl Grewigg Hildrup Hraigl Hwendl Maybel Myrkle Nannigrew Pettigrew Rrhimbr Shord Smethra Wheld)

  @unisex ~w(Addle Andred Blocke Clover Crewwin Curlip Eleye Ellip Frannidore Ghrend Grennigore Gwendl Hrannick Hwoldrup Lindor Merrild Smenthard Snerg Wendlow Windor)

  @surname ~w(Blathergripe Bluegouge Bockbrugh Bockstump Elbowgen Forlocke Hwodlow Lankshorn Lockehorn Longbeard Longshanks Shankwold Smallbuck Snicklebock Snidebleat Snoode Underbleat Underbuck Wolder Woldleap)

  @background [
    "Alchemist's assistant",
    "Angler",
    "Beekeeper",
    "Blacksmith",
    "Brewer",
    "Chandler",
    "Devil goat handler",
    "Gambler",
    "Grave digger",
    "Merchant",
    "Onion farmer",
    "Page",
    "Pig farmer",
    "Servant",
    "Smuggler",
    "Sorcerer's assistant",
    "Standard-bearer",
    "Thatcher",
    "Turnip farmer",
    "Vagrant"
  ]

  @head [
    "Dented helm with coat of arms",
    "Ears pierced with nails or rings",
    "Long, curly locks",
    "Long, floppy ears",
    "Narrow, pointed ears",
    "One bent horn, one straight",
    "One horn broken off",
    "Silver stripe in hair",
    "Slick, oiled hair",
    "Spiky ginger hair",
    "Thin neck, hefty head",
    "Third nub horn on forehead"
  ]

  @face [
    "Black eyes, silver pupils",
    "Buck teeth",
    "Bushy brows",
    "Golden eyes",
    "Lank forelock droops over eyes",
    "Long, wispy chin-beard",
    "Milky white eyes, blue flecks",
    "Missing teeth",
    "Prominent scar",
    "Shaggy chin-beard",
    "Small eyes, close set",
    "Wide, drooling mouth"
  ]

  @fur [
    "Black, flecked with silver",
    "Black, glossy",
    "Ginger, curly",
    "Ginger, rough",
    "Grey, greasy",
    "Grey, lustrous",
    "Russet, spiky",
    "Russet, wavy",
    "Tan, coarse",
    "Tan, shaggy",
    "White, dirty",
    "White, fluffy"
  ]

  @demeanour [
    "Ale-addled",
    "Cool-headed pragmatist",
    "Cultivated aristocratic air",
    "Dour, pessimistic",
    "Earnest, loyal",
    "Endlessly scheming",
    "Flighty, mercurial",
    "Jocular with violent outbursts",
    "Mellow, unflappable",
    "Single-minded, stubborn",
    "Wild hedonist",
    "Wryly philosophical"
  ]

  @desires [
    "Eradicate the Drune",
    "Escape justice for past crime",
    "Found a crime syndicate",
    "Free the common folk",
    "Imprison all crookhorns",
    "Marry into nobility",
    "Outrageous wealth and luxury",
    "Popularise turnip ale",
    "Recover ancient breggle lore",
    "Restore High Wold to Ramius",
    "Swindle Lord Murkin's wealth",
    "Travel and discovery"
  ]

  @dress [
    "Doublet and frilly shirt",
    "Greasy woollens",
    "Grimy apron",
    "Huge, hairy overcoat",
    "Long skirts and cloak",
    "Patched leather, many pockets",
    "Rabbit and squirrel fur",
    "Servant's livery",
    "Thigh boots and waistcoat",
    "Thong and dashing cape",
    "Tweed and deerstalker",
    "Wide, armless frock"
  ]

  @beliefs [
    "Ancestors demand sacrifices",
    "Breggles made standing stones",
    "Breggles originate in Fairy",
    "Church hides breggle saints",
    "Daily garlic wards fairy hexes",
    "Descendant of a mighty wizard",
    "Duke is thrall of the Drune",
    "Fairy is purely mythical",
    "Malbleat serves the Nag-Lord",
    "Malbleat will rule High Wold",
    "Nag-Lord is breggle messiah",
    "The end is nigh"
  ]

  @speech ~w(Cackling Circuitous Coarse Gurgling High-pitched Lackadaisical Mumbling Rumbling Staccato Throaty Warbling Whining)

  @trinket %{
    (1..2) => "A bag of divination stones that always answer \"Panic\" to any question",
    (3..4) => "A bloodstained jester's hat",
    (5..6) => "A bloody knife that cannot be cleaned",
    (7..8) => "A blue velvet jacket with a hidden pocket which moves when you're not looking",
    (9..10) => "A book of poetry that consists primarily of bleating",
    (11..12) =>
      "A bottle of noxious perfume. When sprayed, it can be smelt up to half a mile away",
    (13..14) => "A brass owl statue with eerie black eyes",
    (15..16) => "A broken fishing rod that still displays teeth marks from an enormous fish",
    (17..18) => "A circular ceramic amulet which displays the current moon phase",
    (19..20) => "A clay pot labelled \"Frog Paste,\" containing what appears to be frog paste",
    (21..22) =>
      "A clump of writhing, black moss that you scraped off a looming monolith one lonely night",
    (23..24) =>
      "A collection of papers with scrawled notes detailing your life story. Found on the corpse of a stranger, drowned in a ditch",
    (25..26) =>
      "A curious mossling wind instrument carved out of a gourd. You can't figure out which hole to blow in",
    (27..28) => "A diorama of two stuffed mice riding stuffed squirrels, jousting",
    (29..30) => "A dried mushroom with a face",
    (31..32) => "A folio of pressed sprite-wings",
    (33..34) => "A gnarled root shaped like a mossling",
    (35..36) =>
      "A letter warning that several unnamed but high-ranked longhorns are secretly crookhorns in disguise",
    (37..38) =>
      "A locket with a portrait of a fluffy cat wearing a crown with the inscription \"For the love of King Pusskin\"",
    (39..40) => "A long-nosed masquerade mask",
    (41..42) => "A moleskin wristband, anointed with exotic fairy perfume",
    (43..44) => "A mossling pipe that blows rainbow-coloured smoke rings",
    (45..46) => "A necklace of miscellaneous humanoid teeth",
    (47..48) => "A petrified turnip",
    (49..50) => "A pig heart that oozes ichor when squeezed",
    (51..52) => "A pouch which feels heavy (as if full of pebbles) even when empty",
    (53..54) => "A rusty scalpel that once belonged to Lord Malbleat",
    (55..56) => "A sack of tasty fried chicken legs",
    (57..58) => "A scale said to be from a breggle with a fishtail instead of legs",
    (59..60) =>
      "A scroll containing a prophetic warning from an esteemed ancestor. Age has made it almost indecipherable",
    (61..62) => "A sheet of parchment with a charcoal sketch of your long lost love",
    (63..64) =>
      "A short length of silver cord and a delicate hook, said to be able to catch fairy fish in puddles",
    (65..66) => "A shovel stained with the dirt of a thousand graves",
    (67..68) => "A stuffed vole dressed in a charming waistcoat",
    (69..70) => "A thigh-bone flute",
    (71..72) => "A tin whistle whose tones drive cats wild",
    (73..74) => "A tiny book of nonsense poetry, bound in purple leather",
    (75..76) => "A tiny painting of a four-horned goat",
    (77..78) => "A well-loved walking stick with a goat's head handle",
    (79..80) => "A wooden Chapes (holy symbol of the Pluritine Church) studded with nails",
    (81..82) => "An empty notebook. Anything written in it disappears at sunrise",
    (83..84) => "An ornate pie pan, pilfered from a noble's kitchen",
    (85..86) => "Black stone dice with white skulls for pips",
    (87..88) => "Expensive-looking (but worthless) jewellery, designed for breggle horns",
    (89..90) => "String from the bow of a legendary hunter",
    (91..92) => "The board pieces for fairy chess. You have no idea what the rules are",
    (93..94) => "The cured skin of a whole deer",
    (95..96) => "The horn of an ancestor, hung from a necklace",
    (97..98) => "The key to the prison cell you escaped from",
    (99..100) =>
      "Your grandmother's creepy glass eye. You sometimes feel her presence watching you"
  }

  def random_male_name, do: Enum.random(@male) <> " " <> Enum.random(@surname)
  def random_female_name, do: Enum.random(@female) <> " " <> Enum.random(@surname)
  def random_unisex_name, do: Enum.random(@unisex) <> " " <> Enum.random(@surname)

  def random_name do
    gender = [@male, @female, @unisex] |> Enum.random()
    Enum.random(gender) <> " " <> Enum.random(@surname)
  end

  def roll_background, do: Enum.random(@background)
  def roll_trinket, do: Dice.roll_table(@trinket, 1..100)
  def roll_head, do: Enum.random(@head)
  def roll_face, do: Enum.random(@face)
  def roll_fur, do: Enum.random(@fur)
  def roll_speech, do: Enum.random(@speech)
  def roll_demeanour, do: Enum.random(@demeanour)
  def roll_desires, do: Enum.random(@desires)
  def roll_dress, do: Enum.random(@dress)
  def roll_beliefs, do: Enum.random(@beliefs)

  def roll_all_details do
    %{
      name: random_name(),
      background: roll_background(),
      trinket: roll_trinket(),
      head: roll_head(),
      face: roll_face(),
      fur: roll_fur(),
      speech: roll_speech(),
      demeanour: roll_demeanour(),
      desires: roll_desires(),
      dress: roll_dress(),
      beliefs: roll_beliefs()
    }
  end
end
