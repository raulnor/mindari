defmodule Dolmenwood.Kindred.Human do
  alias Dolmenwood.Dice

  @male ~w(Arfred Brom Bunk Chydewick Crump Dimothy Guillem Henrick Hogrid Jappser Joremey Josprey Jymes Mollequip Rodger Rogbert Samwise Shadwell Shank Sidley)

  @female ~w(Agnel Amonie Celenia Emelda Gertwinne Gilly Gretchen Gwendolyne Hilda Illabell Katerynne Lillibeth Lillith Lisabeth Mabel Maydrid Melysse Molly Pansy Roese)

  @unisex ~w(Andred Arda Aubrey Clement Clewyd Dayle Gemrand Hank Lyren Maude Megynne Moss Robyn Rowan Sage Tamrin Ursequine Waldra Waydred Wendlow)

  @surname ~w(Addercapper Burl Candleswick Crumwaller Dogoode Dregger Dunwallow Fraggleton Gruewater Harper Lank Logueweave Loomer Malksmilk Smith Sunderman Swinney Tolmen Weavilman Wolder)

  @background %{
    (1..1) => "Actor",
    (2..5) => "Angler",
    (6..6) => "Animal trainer",
    (7..7) => "Apothecary",
    (8..10) => "Baker",
    (11..11) => "Barber",
    (12..12) => "Beekeeper",
    (13..15) => "Beggar",
    (16..18) => "Blacksmith",
    (19..19) => "Bookbinder",
    (20..21) => "Brewer",
    (22..24) => "Butcher",
    (25..28) => "Carpenter",
    (29..29) => "Cartographer",
    (30..32) => "Cattle farmer",
    (33..33) => "Chandler",
    (34..34) => "Cheesemaker",
    (35..35) => "Cobbler",
    (36..36) => "Cooper",
    (37..37) => "Dockhand",
    (38..38) => "Fortune-teller",
    (39..39) => "Fur trapper",
    (40..41) => "Gambler",
    (42..42) => "Glassblower",
    (43..43) => "Grave digger",
    (44..45) => "Hog farmer",
    (46..49) => "Hunter",
    (50..50) => "Jester",
    (51..51) => "Jeweller",
    (52..52) => "Leather worker",
    (53..53) => "Locksmith",
    (54..54) => "Merchant",
    (55..56) => "Miner",
    (57..58) => "Outlaw",
    (59..60) => "Pedlar",
    (61..61) => "Pilgrim",
    (62..63) => "Poacher",
    (64..64) => "Potter",
    (65..65) => "Roper",
    (66..66) => "Sailor",
    (67..67) => "Scribe",
    (68..71) => "Servant",
    (72..73) => "Sheep farmer",
    (74..74) => "Shipwright",
    (75..75) => "Smuggler",
    (76..76) => "Stable hand",
    (77..77) => "Stonemason",
    (78..78) => "Swindler",
    (79..79) => "Tailor",
    (80..80) => "Tax collector",
    (81..81) => "Thatcher",
    (82..84) => "Turnip farmer",
    (85..85) => "Unicorn hunter",
    (86..87) => "Vagrant",
    (88..88) => "Wainwright",
    (89..90) => "Wayfarer",
    (91..92) => "Weaver",
    (93..95) => "Wheat farmer",
    (96..96) => "Wizard's assistant",
    (97..100) => "Woodcutter"
  }

  @trinket %{
    (1..2) => "A black stone which always points towards the sun",
    (3..4) => "A blood sausage, allegedly made of wyrm's blood",
    (5..6) => "A blood-stained handkerchief that won't wash clean",
    (7..8) => "A bone statuette of a mermaid with prodigiously hairy armpits",
    (9..10) => "A bright red egg that was given to you by a sprite",
    (11..12) => "A clay effigy that whispers to you in your sleep",
    (13..14) => "A cracked marble that falls in slow motion",
    (15..16) => "A deck of cards illustrated with blindfolded kings, queens, knaves, etc.",
    (17..18) => "A drinking horn carved with cavorting nymphs",
    (19..20) => "A dubious fake moustache made of rat fur",
    (21..22) =>
      "A fine set of silver cutlery and a floral china tea-set, all packed in a wicker hamper",
    (23..24) => "A foot-long, spicy sausage",
    (25..26) => "A gauntlet of wyrm scales",
    (27..28) => "A goatskin pouch full of giblets",
    (29..30) => "A head-sized glass sphere with a neck opening",
    (31..32) => "A hunk of ancient, mouldy cheese",
    (33..34) => "A jar that breeds flies, even when tightly sealed",
    (35..36) =>
      "A jaunty cap (with a feather stuck in it) which jumps up whenever anyone says your name",
    (37..38) => "A lavender scented cushion embroidered with black roses and thorns",
    (39..40) => "A lock of hair from the first person you killed",
    (41..42) => "A long kilt of woven moss",
    (43..44) => "A love letter you are penning in silver ink to your fairy betrothed",
    (45..46) => "A miniature brass gnome that appears on your pillow looking at you each morning",
    (47..48) => "A napkin and cutlery that you stole from a fancy inn",
    (49..50) => "A note from your mother admonishing you to return home as soon as able",
    (51..52) =>
      "A pair of stripy woollen socks that keep your feet as warm and dry as fine boots",
    (53..54) => "A pebble that glows faintly in the dark",
    (55..56) => "A piece of the moon that fell to earth. (Or is it a hunk of desiccated cheese?)",
    (57..58) => "A porcelain teapot painted with a scene of owls devouring humans",
    (59..60) => "A raven's feather quill that writes without ink",
    (61..62) => "A silver belt woven from the mane of a kelpie",
    (63..64) => "A silver mirror that always reflects the sky",
    (65..66) => "A silver ring that shrinks or expands to fit whatever finger it is placed upon",
    (67..68) =>
      "A tiny fish in a jar of water. At night, it whispers the names of everyone within 5'",
    (69..70) => "A tiny wicker effigy that you stole from a witch's hut",
    (71..72) => "A unicorn statuette carved out of mushroom-wood",
    (73..74) => "A wanted poster for yourself",
    (75..76) => "A well-thumbed and annotated book of psalms",
    (77..78) => "An ash wand stained with the blood of a troll",
    (79..80) => "An enormous Green Man brass belt buckle",
    (81..82) => "An ornate lantern you found in a bog",
    (83..84) =>
      "Sixteen silver pieces, greased with slippery magical oil that cannot be washed off",
    (85..86) => "The broken tip of a unicorn's horn",
    (87..88) => "The fairy sword that slew your father",
    (89..90) => "The mummified hand of a bog body",
    (91..92) => "The scintillating, silvery feather of a witch owl",
    (93..94) => "The skeleton of an especially large toad, in pieces",
    (95..96) => "The skull of a Drune, stolen from a forbidden crypt",
    (97..98) => "The wobbly, pink severed hand of a gelatinous ape, still fresh and sweet",
    (99..100) => "Your grandfather's beard, rolled up in a hessian cloth"
  }

  @head [
    "Cropped or shaven hair",
    "Embroidered skull cap",
    "Fur hat with animal tail",
    "Jaunty cap with feather",
    "Jug ears",
    "Long braids",
    "Meticulously oiled hair",
    "Misshapen skull",
    "Patchy, straggly hair",
    "Poised atop an elegant neck",
    "Thick, lustrous hair",
    "Wild, curly hair"
  ]

  @face [
    "Bent nose",
    "Button nose",
    "Darting eyes",
    "Droll, lupine mouth",
    "Gap-toothed",
    "Hirsute",
    "Large, regal nose",
    "Narrow, pinched",
    "Pimples",
    "Prominent scar",
    "Rosy",
    "Wide, spaced out features"
  ]

  @body [
    "Barrel chest",
    "Big hands",
    "Blotchy skin",
    "Excessively hairy",
    "Freckles",
    "Long legs",
    "Long, elegant fingers",
    "Oily skin",
    "Pocked with plague-scars",
    "Pot belly",
    "Smooth, supple skin",
    "Warts"
  ]

  @speech [
    "Agitated",
    "Bellowing",
    "Cackling",
    "Coarse",
    "Conspiratorial",
    "Gravelly",
    "Inane banter",
    "Mellow",
    "Mumbling",
    "Nasal whine",
    "Rapid",
    "Sighing"
  ]

  @demeanour [
    "Brooding, quick-tempered",
    "Curious, broad-minded",
    "Dour, single-minded",
    "Enthusiastic, gullible",
    "Gregarious",
    "Impatient and rash",
    "Kindly",
    "Miserly",
    "Scheming",
    "Self-aggrandising",
    "Slovenly",
    "Suave"
  ]

  @dress [
    "Colourful patchwork",
    "Dashing doublet and hose",
    "Enigmatic cloak and hood",
    "Filthy woollens",
    "Hessian rags",
    "Lace, posies, and frills",
    "Noisome furs",
    "Padded vest and breeches",
    "Sheepskin coat",
    "Smoking jacket and slacks",
    "Sturdy boots and raincoat",
    "Way-worn leathers"
  ]

  @desires [
    "Build castle and new village",
    "Clear family name",
    "Collect saintly relics",
    "Domestic bliss",
    "Explore Fairy",
    "Found business empire",
    "Infamy",
    "Map stones of Dolmenwood",
    "Marry into nobility",
    "Redeem past misdeeds",
    "Secret underground lair",
    "Squander fortune on luxury"
  ]

  @beliefs [
    "Bishop is a werewolf",
    "Drune will enslave the duke",
    "Fairies steal human souls",
    "Nag-Lord brings final doom",
    "One parent was an elf",
    "Prayers redeem evil deeds",
    "Shroom of immortality",
    "Sunken village in Longmere",
    "Talking beasts plot uprising",
    "The dead are rising",
    "Visions from the Cold Prince",
    "Witches serve the Nag-Lord"
  ]

  def random_male_name, do: Enum.random(@male) <> " " <> Enum.random(@surname)
  def random_female_name, do: Enum.random(@female) <> " " <> Enum.random(@surname)
  def random_unisex_name, do: Enum.random(@unisex) <> " " <> Enum.random(@surname)

  def random_name do
    first = [@male, @female, @unisex] |> Enum.random() |> Enum.random()
    first <> " " <> Enum.random(@surname)
  end

  def roll_background, do: Dice.roll_table(@background, 100)
  def roll_trinket, do: Dice.roll_table(@trinket, 100)
  def roll_head, do: Enum.random(@head)
  def roll_face, do: Enum.random(@face)
  def roll_body, do: Enum.random(@body)
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
      body: roll_body(),
      speech: roll_speech(),
      demeanour: roll_demeanour(),
      dress: roll_dress(),
      desires: roll_desires(),
      beliefs: roll_beliefs()
    }
  end
end
