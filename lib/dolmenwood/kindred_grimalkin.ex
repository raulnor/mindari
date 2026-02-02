defmodule Dolmenwood.Kindred.Grimalkin do
  alias Dolmenwood.Dice

  @first_name [
    "Boots",
    "Fripple",
    "Ginger",
    "Jack/Jill",
    "Jaspy",
    "Jasqueline",
    "Kitty",
    "Little",
    "Lord/Lady",
    "Mogget",
    "Moggle",
    "Monsieur/Madame",
    "Nibbles",
    "Penny",
    "Poppet",
    "Prince/Princess",
    "Prissy",
    "Tippsy",
    "Tomkin",
    "Toppsy"
  ]

  @surname [
    "Bobblewhisk",
    "Cottonsocks",
    "Flip-a-tail",
    "Flippancy",
    "Fluff-a-kin",
    "Grimalgrime",
    "Grinser",
    "Lickling",
    "Milktongue",
    "Mogglin",
    "Poppletail",
    "Pouncemouse",
    "Pusskin",
    "Ratbane",
    "Snuffle",
    "Tailwhisk",
    "Tippler",
    "Whippletongue",
    "Whipsy",
    "Whiskers"
  ]

  @background [
    "Alchemist's aide",
    "Angler",
    "Barber",
    "Card-sharp",
    "Catnip brewer",
    "Clothier",
    "Duellist",
    "Highway robber",
    "Knifemaker",
    "Libertine",
    "Mariner",
    "Pheasant poacher",
    "Rat hunter",
    "Spy",
    "Stage magician",
    "Swindler",
    "Thespian",
    "Trapper / furrier",
    "Vole farmer",
    "Weasel tamer"
  ]

  @trinket %{
    (1..2) => "A bicorne hat that is a foot deeper on the inside than it appears",
    (3..4) => "A book of long-forgotten laws, written in Old Woldish",
    (5..6) => "A brass thimble that turns water into milk",
    (7..8) => "A breggle tongue, still moist",
    (9..10) => "A cherry tart pilfered from the kitchen of a fairy noble",
    (11..12) => "A cloak fashioned from a hundred voles",
    (13..14) => "A copper coin that always lands on the same side when deliberately flipped",
    (15..16) => "A crimson feather from an enormous bird",
    (17..18) => "A dead crow that never rots",
    (19..20) => "A deck of playing cards that shuffles itself when left unattended",
    (21..22) => "A dried heart the size of an acorn",
    (23..24) => "A hairball coughed up by a famous grimalkin",
    (25..26) => "A handkerchief stained with the kiss of Queen Abyssinia",
    (27..28) =>
      "A heart-shaped locket. Each time it's opened, it contains a portrait of a different cat",
    (29..30) => "A human eye that dilates just before it rains",
    (31..32) =>
      "A hundred-year-old note offering a favour in return for services rendered to a witch. Her descendants might be obligated to fulfil it",
    (33..34) => "A leaf from the tallest tree in Dolmenwood",
    (35..36) => "A letter begging you to aid a miller's youngest child",
    (37..38) =>
      "A live cockroach tied to a thin gold string. If the cockroach is removed or killed, a new one appears in its place when the sun rises",
    (39..40) => "A lucky tortoise shell",
    (41..42) => "A lute that is always out of tune in the morning and in tune in the evening",
    (43..44) => "A luxurious, gold-embroidered cushion",
    (45..46) => "A mouse skull on a string. (Allegedly, a mouse from the moon.)",
    (47..48) => "A mushroom stolen from the head of a mossling",
    (49..50) => "A nightingale's song, trapped in a locket",
    (51..52) => "A pair of boots that will never go out of fashion",
    (53..54) => "A pair of dice that, when rolled together, always total to nine",
    (55..56) => "A pink bow that cannot turn invisible under any circumstances",
    (57..58) => "A pocket watch that always tells you the correct time an hour ago",
    (59..60) =>
      "A porcelain teacup with a salamander painted on the side. Warm liquids it holds never cool down",
    (61..62) => "A rabbit's foot that sporadically twitches",
    (63..64) => "A rat king in a sack. Each rat inside claims to be the \"King of All Rats.\"",
    (65..66) => "A realistic mask of a human child",
    (67..68) => "A scroll depicting your royal lineage. Of dubious authenticity",
    (69..70) => "A set of keys on a golden ring, purloined from a noble",
    (71..72) => "A severed head of a sprite, dried and preserved",
    (73..74) => "A sewing needle, sized for a giant. (Treat as a dagger.)",
    (75..76) => "A shard of cold iron, trapped in a glass sphere",
    (77..78) => "A single cat whisker, given to you as a sign of commitment",
    (79..80) => "A singular pipe, taken from a woodgrue's pan flute",
    (81..82) => "A small vial containing a legendarily potent strain of catnip",
    (83..84) => "A tiny bell that makes no sound",
    (85..86) => "A trained, but not particularly smart, weasel",
    (87..88) => "A whistle that only dogs can't hear",
    (89..90) => "A wolf's paw that bleeds when the wolf is thinking of you",
    (91..92) => "A wooden door the shape and size of a mouse",
    (93..94) => "An eyepatch, stained with old blood",
    (95..96) => "An ogre's toenail, tough as steel. Its owner still lives",
    (97..98) => "Eyeglasses haunted by benign ghosts. Wearing the glasses allows you to see them",
    (99..100) => "One of a pair of bracelets made from braided mouse tails"
  }

  @head [
    "Carefully sculpted quiff",
    "Dapper top hat",
    "Extravagant ear fur",
    "Floppy beret",
    "Floppy ear",
    "Jaunty tricorn hat",
    "Plumed hat",
    "Pointy ear tufts",
    "Shaggy mane",
    "Spotted headscarf",
    "Torn ear",
    "Unrealistically large"
  ]

  @face [
    "Bug-eyed",
    "Constantly looks surprised",
    "Copper, saucer-like eyes",
    "Extra fluffy cheeks",
    "Extravagantly long whiskers",
    "Flabby jowls",
    "Flashing silver eyes",
    "Long, pointy snout",
    "Mostly mouth",
    "Snaggle-toothed",
    "Snub nose",
    "Tongue pokes out"
  ]

  @fur [
    "Black",
    "Black and white",
    "Blue",
    "Brown tabby",
    "Chocolate",
    "Ginger tabby",
    "Iridescent",
    "Silver, fluffy",
    "Tortoiseshell",
    "Violet",
    "White, spiky",
    "White, fluffy"
  ]

  @speech [
    "Adorable mewling",
    "Conspiratorial whispering",
    "Decadently fashionable",
    "Eloquent and poetic",
    "Impertinent",
    "Languid",
    "Manic",
    "Meandering",
    "Mirthful and mocking",
    "Purring",
    "Sycophantic",
    "Wilfully abstruse"
  ]

  @demeanour [
    "Boastful",
    "Fastidious and precise",
    "Irreverently jocund",
    "Jittery and on edge",
    "Loose with money",
    "Mercurial",
    "Reckless swashbuckler",
    "Self-indulgent preening",
    "Slumbersome",
    "Sneaky and larcenous",
    "Snobbish gourmet",
    "Tipsy and frolicsome"
  ]

  @dress [
    "Cape and spurs",
    "Dandyish lace and silks",
    "Festooned with rat bones",
    "Jet black woollens",
    "Long gloves and chaps",
    "Long, colourful knitted scarf",
    "Pied doublet and breeches",
    "Ratskin vest and breeches",
    "Regal ermine cloak",
    "Shiny red boots",
    "Smart tweed",
    "Tassels and fringes"
  ]

  @desires [
    "Become a crime lord",
    "Become fat eating rodents",
    "Build a secret palace",
    "Build a sky ship to the moon",
    "Commune with lost cat gods",
    "Fame as a slayer of monsters",
    "Found a catnip distillery",
    "Infamy as a supreme gambler",
    "Inhabit Hoarblight Keep",
    "Live in exorbitant luxury",
    "Marry into human nobility",
    "Steal the duke's jewels"
  ]

  @beliefs [
    "Catnip is poison to humans",
    "Consume mouse-flesh daily",
    "Dreams are the true reality",
    "Evil rat realm underground",
    "Human nobles serve Catland",
    "Magic is fading",
    "Only eat raw meat",
    "The Cold Prince is long dead",
    "The moon is ruled by mice",
    "The Nag-Lord adores cats",
    "Vegetables harm the health",
    "War is brewing in Fairy"
  ]

  def random_name, do: Enum.random(@first_name) <> " " <> Enum.random(@surname)

  def roll_background, do: Enum.random(@background)
  def roll_trinket, do: Dice.roll_table(@trinket, 100)
  def roll_head, do: Enum.random(@head)
  def roll_face, do: Enum.random(@face)
  def roll_fur, do: Enum.random(@fur)
  def roll_speech, do: Enum.random(@speech)
  def roll_demeanour, do: Enum.random(@demeanour)
  def roll_dress, do: Enum.random(@dress)
  def roll_desires, do: Enum.random(@desires)
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
      dress: roll_dress(),
      desires: roll_desires(),
      beliefs: roll_beliefs()
    }
  end
end
