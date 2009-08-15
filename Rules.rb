# This file contains some rules information which you can fiddle with.

ATTRS_STARTING_POINT_COST = [0, 0, 01, 02, 03, 05]
ATTR_XP_COSTS =             [0, 5, 15, 30, 50, 75]
MENTAL_ATTRS =              [:intelligence, :wits, :resolve]
PHYSICAL_ATTRS =            [:strength, :dexterity, :stamina]
SOCIAL_ATTRS =              [:presence, :manipulation, :composure]

SKILLS_STARTING_POINT_COST =  [0, 1, 2, 03, 04, 06]
SKILL_XP_COSTS =              [0, 3, 9, 18, 30, 45]

MENTAL_SKILLS =   [ :academics, 
                    :computer, 
                    :crafts, 
                    :investigation, 
                    :medicine, 
                    :occult, 
                    :politics, 
                    :science]
PHYSICAL_SKILLS = [ :athletics, 
                    :brawl, 
                    :drive,
                    :firearms,
                    :larceny,
                    :stealth,
                    :survival,
                    :weaponry]
SOCIAL_SKILLS =   [ :animal_ken, 
                    :empathy, 
                    :expression,
                    :intimidation,
                    :persuasion,
                    :socialize,
                    :streetwise,
                    :subterfuge]

SPECIALIZATION_COST = 3

ATTRS_BY_TYPE = [ MENTAL_ATTRS, 
                  PHYSICAL_ATTRS, 
                  SOCIAL_ATTRS]

ATTRS = ATTRS_BY_TYPE.flatten

SKILLS_BY_TYPE = [MENTAL_SKILLS, 
                  PHYSICAL_SKILLS, 
                  SOCIAL_SKILLS]

SKILLS = SKILLS_BY_TYPE.flatten


# So far I have costs in, but not prerequisites.
MENTAL_MERITS = [
  :common_sense               => {:cost => 4,       :prereq => nil},
  :danger_sense               => {:cost => 2,       :prereq => nil},
  :eidetic_memory             => {:cost => 2,       :prereq => nil},
  :encyclopedic_knowledge     => {:cost => 4,       :prereq => nil},
  :holistic_awareness         => {:cost => 3,       :prereq => nil},
  :language                   => {:cost => [1..3],  :prereq => nil},
  :meditative_mind            => {:cost => 1,       :prereq => nil},
  :unseen_sense               => {:cost => 3,       :prereq => nil}
]

PHYSICAL_MERITS = [
  :ambidextrous               => {:cost => 3,       :prereq => nil},
  :brawling_dodge             => {:cost => 1,       :prereq => nil},
  :direction_sense            => {:cost => 1,       :prereq => nil},
  :disarm                     => {:cost => 2,       :prereq => nil},
  :fast_reflexes              => {:cost => [1..2],  :prereq => nil},
  :fighting_finesse           => {:cost => 2,       :prereq => nil},
  :fighting_style_boxing      => {:cost => [1..5],  :prereq => nil},
  :fighting_style_kung_fu     => {:cost => [1..5],  :prereq => nil},
  :fighting_style_two_weapons => {:cost => [1..4],  :prereq => nil},
  :fleet_of_foot              => {:cost => [1..3],  :prereq => nil},
  :fresh_start                => {:cost => 1,       :prereq => nil},
  :giant                      => {:cost => 4,       :prereq => nil},
  :gunslinger                 => {:cost => 3,       :prereq => nil},
  :iron_stamina               => {:cost => [1..3],  :prereq => nil},
  :iron_stomach               => {:cost => 2,       :prereq => nil},
  :natural_immunity           => {:cost => 1,       :prereq => nil},
  :quick_draw                 => {:cost => 1,       :prereq => nil},
  :quick_healer               => {:cost => 4,       :prereq => nil},
  :strong_back                => {:cost => 1,       :prereq => nil},
  :strong_lungs               => {:cost => 3,       :prereq => nil},
  :stunt_driver               => {:cost => 3,       :prereq => nil},
  :toxin_resistance           => {:cost => 2,       :prereq => nil},
  :weaponry_dodge             => {:cost => 1,       :prereq => nil}
]

SOCIAL_MERITS = [
  :allies                     => {:cost => [1..5],  :prereq => nil},
  :barfly                     => {:cost => 1,       :prereq => nil},
  :contacts                   => {:cost => [1..5],  :prereq => nil},
  :fame                       => {:cost => [1..3],  :prereq => nil},
  :inspiring                  => {:cost => 4,       :prereq => nil},
  :mentor                     => {:cost => [1..5],  :prereq => nil},
  :resources                  => {:cost => [1..5],  :prereq => nil},
  :retainer                   => {:cost => [1..5],  :prereq => nil},
  :status                     => {:cost => [1..5],  :prereq => nil},
  :striking_looks             => {:cost => [2, 4],  :prereq => nil}
]
