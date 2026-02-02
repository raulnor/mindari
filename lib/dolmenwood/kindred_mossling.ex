defmodule Dolmenwood.Kindred.Mossling do
  alias Dolmenwood.Dice

  @male [
    "Dombo",
    "Gobd",
    "Gobulom",
    "Golobd",
    "Gremo",
    "Gwomotom",
    "Hollogowl",
    "Kabob",
    "Kollobom",
    "Limbly",
    "Loblow",
    "Mobdemold",
    "Nyoma",
    "Obolm",
    "Oglom",
    "Omb",
    "Shmold",
    "Slumbred",
    "Umbertop",
    "Wobobold"
  ]

  @female [
    "Bilibom",
    "Brimbul",
    "Ebbli",
    "Ghibli",
    "Gobbli",
    "Gwedim",
    "Higwold",
    "Ibulold",
    "Imbwi",
    "Klibli",
    "Klimbim",
    "Libib",
    "Limimb",
    "Marib",
    "Milik",
    "Shlirimi",
    "Shobd",
    "Skimbim",
    "Slimpk",
    "Smodri"
  ]

  @unisex [
    "Bendiom",
    "Blobul",
    "Ebdwol",
    "Glob",
    "Gombly",
    "Greblim",
    "Gwoodwom",
    "Hollb",
    "Klolb",
    "Kwolotomb",
    "Lambop",
    "Morromb",
    "Mwoomb",
    "Olob",
    "Oobl",
    "Shlurbel",
    "Smodron",
    "Tomdown",
    "Tomumbolo",
    "Worrib"
  ]

  @surname [
    "Barkhop",
    "Conker",
    "Danklow",
    "Fernhead",
    "Frother",
    "Grimehump",
    "Hogscap",
    "Mossbeard",
    "Mossfurrow",
    "Mould",
    "Mouldfinger",
    "Mudfoot",
    "Mugfoam",
    "Mulchwump",
    "Mushrump",
    "Oddpolyp",
    "Puffhelm",
    "Smallcheese",
    "Sodwallow",
    "Twiggler"
  ]

  @symbiotic_flesh [
    "Outer parts of ears replaced by jelly fungus",
    "Patches of lichen",
    "Dainty flowers bloom in the beard in springtime",
    "Yeast infections in moist places",
    "Toadstools growing from joints",
    "Covered in slimy, green jelly",
    "Miniature tree growing from ear",
    "Skin riddled with mycelia",
    "Eyes fur over with transparent, yellow mould",
    "Edible toe cheese",
    "Growths of woody, bracket fungus in the armpits",
    "Mossy feet",
    "Climbing vines wrapped around limbs and torso",
    "Radical fern growth around groin",
    "Mossy biceps",
    "Puffball growths around the buttocks and knees",
    "Parsley chest hair",
    "Blackberry brambles tangled in the hair",
    "Edible mushrooms growing in hair",
    "Semi-sentient mushroom growing from top of head"
  ]

  @background [
    "Bark tailor",
    "Boar hunter",
    "Cheesemaker",
    "Compost raker",
    "Fungologist",
    "Fungus farmer",
    "Gambler",
    "Horn blower",
    "Moss brewer",
    "Moss farmer",
    "Night forager",
    "Oracle's apprentice",
    "Pipe maker",
    "Sausage maker",
    "Squirrel trainer",
    "Swineherd",
    "Tavernkeep",
    "Vagrant",
    "Worm farmer",
    "Yeast farmer"
  ]

  @trinket %{
    (1..2) => "A bag of stone marbles. Each has a name and rolls towards whoever speaks it",
    (3..4) => "A block of cheese infected with hallucinogenic fungus",
    (5..6) => "A bloodstained hat that once belonged to a redcap",
    (7..8) =>
      "A book alleging crimes by each of the 100 saints of Dolmenwood. Found on the body of a murdered man",
    (9..10) =>
      "A bottle of yeast-froth shampoo, essential for maintaining the lustre of mossy manes",
    (11..12) => "A bouquet of honeysuckle that drips real honey. The honey attracts wasps",
    (13..14) =>
      "A brass cowbell. When struck, nearby milk and cheese products jump half a foot towards it",
    (15..16) => "A broad-brimmed hat covered in shimmering moss",
    (17..18) => "A bronze idol to a two-headed mushroom god",
    (19..20) =>
      "A chunk of volcanic rock, warm to the touch. A single Old Woldish rune has been carved into it",
    (21..22) => "A clay figurine of a pot-bellied giant with a single eye",
    (23..24) =>
      "A cluster of fungus consisting of a dozen different kinds of mushrooms living in symbiosis",
    (25..26) => "A collection of small rocks, all chipped from different gravestones",
    (27..28) => "A cooking pot that adds mushrooms to every dish cooked inside it",
    (29..30) => "A flower pressed inside a dead man's journal",
    (31..32) => "A hunting horn fashioned from a great boar tusk",
    (33..34) => "A jar of blue cheese massage oil",
    (35..36) => "A jar of green jelly with the label \"Don't Eat Me.\"",
    (37..38) => "A large egg, entrusted to you by a panicked woodgrue",
    (39..40) => "A large gooseberry that appears to have a creature growing inside it",
    (41..42) => "A large, pink sausage. Tries to crawl away if left unattended",
    (43..44) =>
      "A leaf that changes with the seasons, dying by winter only to rejuvenate in spring",
    (45..46) =>
      "A mossy rock. When placed on the ground for at least a minute and then lifted, bugs scurry out from underneath it",
    (47..48) => "A mould-riddled tapestry depicting the hunt for a swine of mythic size",
    (49..50) => "A puffball with dozens of tiny mouths which burp in unison at dawn",
    (51..52) => "A puffball-skin pouch filled with jelly",
    (53..54) => "A sack of half-empty ale bottles",
    (55..56) =>
      "A sealed bottle of spirits, brewed from the composted remains of one of your ancestors",
    (57..58) => "A shepherd's crook that induces fear in farm animals when brandished",
    (59..60) => "A single hair from the head of an elven lady; a token of her affection",
    (61..62) =>
      "A small beetle you found on the road. You have since received a letter from an angry grimalkin charging you with its theft",
    (63..64) => "A small effigy of a breggle made from dried mushroom flesh",
    (65..66) =>
      "A small pouch of magic nuts. When a nut is broken open, it emits a pearl of wisdom",
    (67..68) =>
      "A small snake with a \"Return to\" note attached. The owner's name is smudged out",
    (69..70) => "A small, hollow toadstool with a tiny wooden door",
    (71..72) =>
      "A snail shell that grows a new snail at dawn if the old one is removed or killed",
    (73..74) => "A squirrel-sized collar and leash",
    (75..76) => "A story book about the charming exploits of the rat-people of the moon",
    (77..78) => "A unique pipeweed mix of your own invention. A bit too combustible",
    (79..80) => "A watering can that constantly trickles water from its spout",
    (81..82) => "A waterskin of yellow slime that drips upwards when unstoppered",
    (83..84) => "A wheel of cheese that never loses momentum once it starts rolling",
    (85..86) => "A wooden carving of yourself that ages as you do",
    (87..88) => "A wooden peg leg that you found and converted into an incubator for rare fungi",
    (89..90) => "A worm whose squirming slowly spells out threatening prophecies",
    (91..92) =>
      "An adorable red-and-white button mushroom. Whispers to you when no one else is listening",
    (93..94) => "An incomplete, and possibly inaccurate, map of all the inns in Dolmenwood",
    (95..96) => "An onion shaped like a baby",
    (97..98) => "Blueprints for a marvellous mechanical mouse organ clock",
    (99..100) => "Dozens of different kinds of bark, stitched together like a book"
  }

  @head [
    "Bald like a polished nut",
    "Buzzing with flies",
    "Floppy hat droops over eyes",
    "Fuzzy green hair",
    "Huge floppy ears",
    "Long greasy hair",
    "Much too big",
    "No neck",
    "Patchy orange hair",
    "Pointy felt hat",
    "Wobbly",
    "Wrinkled like a walnut"
  ]

  @face [
    "Beard of frothy yeast",
    "Darting tongue",
    "Eyes as big as fists",
    "Eyes like pools of deep space",
    "Eyes like tiny black marbles",
    "Long, floppy nose",
    "Looks like a carved potato",
    "Massive flared nostrils",
    "Mouth foaming with yeast",
    "Nostrils ooze purple slime",
    "Pointy root nose",
    "Wobbly lips"
  ]

  @body [
    "Blubbery",
    "Covered in downy fur",
    "Flabby rolls",
    "Lumpy",
    "Rampant belly button fur",
    "Spherical",
    "Stubby legs",
    "Stumpy arms",
    "Whorled like knotted wood",
    "Wider than tall",
    "Wobbly paunch",
    "Wrinkled folds of skin"
  ]

  @speech [
    "Baritone",
    "Filthy",
    "Grumbling",
    "Meandering",
    "Mumbling",
    "Muttering",
    "Obtuse",
    "Phlegmy",
    "Squeaking",
    "Squelchy",
    "Stammering",
    "Wheezy"
  ]

  @demeanour [
    "Blustery",
    "Brooding",
    "Cowardly",
    "Dozy",
    "Flustered",
    "Grumpy",
    "Impertinent",
    "Lethargic",
    "Miserly",
    "Overbearingly affable",
    "Shrewd",
    "Tells terrible jokes"
  ]

  @dress [
    "Brushed felt",
    "Cosy knitwear",
    "Dapper tweed",
    "Greasy leathers",
    "Grubby rags",
    "Knitted ivy",
    "Loincloth",
    "Naturist",
    "Pelts",
    "Pig suede",
    "Scratchy wool",
    "Woven fungus stems"
  ]

  @desires [
    "A dozen spouses",
    "Acquire moon cheese",
    "Become a fungus giant",
    "Breed a sentient swine",
    "Brew the universal elixir",
    "Consume sentient fungi",
    "Found a moss brewery",
    "Found underground realm",
    "Grow clones of self",
    "Meld with the fungal mind",
    "Own a sprawling inn",
    "Sample all known ales"
  ]

  @beliefs [
    "Ale is essential for life",
    "Bathing is inimical to health",
    "Daily sacrifice to the elders",
    "Gets visions from the moon",
    "Humans are naked monkeys",
    "Pursued by vengeful ghosts",
    "Stone circles hide buried gold",
    "Talking owls are plotting",
    "The Drune will conquer all",
    "The duke is secretly a fairy",
    "The fungal mind is supreme",
    "The trees have eyes"
  ]

  @knacks [
    "Bird friend",
    "Lock singer",
    "Root friend",
    "Thread whistling",
    "Wood kenning",
    "Yeast master"
  ]

  def random_male_name, do: Enum.random(@male) <> " " <> Enum.random(@surname)
  def random_female_name, do: Enum.random(@female) <> " " <> Enum.random(@surname)
  def random_unisex_name, do: Enum.random(@unisex) <> " " <> Enum.random(@surname)

  def random_name do
    first = [@male, @female, @unisex] |> Enum.random() |> Enum.random()
    first <> " " <> Enum.random(@surname)
  end

  def roll_symbiotic_flesh, do: Enum.random(@symbiotic_flesh)
  def roll_background, do: Enum.random(@background)
  def roll_trinket, do: Dice.roll_table(@trinket, 100)
  def roll_head, do: Enum.random(@head)
  def roll_face, do: Enum.random(@face)
  def roll_body, do: Enum.random(@body)
  def roll_speech, do: Enum.random(@speech)
  def roll_demeanour, do: Enum.random(@demeanour)
  def roll_dress, do: Enum.random(@dress)
  def roll_desires, do: Enum.random(@desires)
  def roll_beliefs, do: Enum.random(@beliefs)
  def roll_knacks, do: Enum.random(@knacks)

  def roll_all_details do
    %{
      name: random_name(),
      symbiotic_flesh: roll_symbiotic_flesh(),
      background: roll_background(),
      trinket: roll_trinket(),
      head: roll_head(),
      face: roll_face(),
      body: roll_body(),
      speech: roll_speech(),
      demeanour: roll_demeanour(),
      dress: roll_dress(),
      desires: roll_desires(),
      beliefs: roll_beliefs(),
      knacks: roll_knacks()
    }
  end
end
