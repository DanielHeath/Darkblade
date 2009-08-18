MERIT_STARTING_POINTS       = 7
MERIT_STARTING_POINT_COST   = [0, 1, 2, 03, 04, 06]
MERIT_XP_COSTS              = [0, 2, 6, 12, 20, 30]

mental :common_sense, 4
mental :danger_sense, 2
mental :eidetic_memory, 2
mental :encyclopedic_knowledge, 4
mental :holistic_awareness, 3
mental :language, 1..3, :specialized => true
mental :meditative_mind, 1
mental :unseen_sense, 3, :specialized => true
  prerequisite_faction :mortal
  prerequisite_attribute :wits, 2
  
physical :ambidextrous, 3
physical :brawling_dodge, 1
  prerequisite_skill :brawl, 1
  prerequisite_attribute :strength, 2
physical :direction_sense, 1
physical :disarm, 2
  prerequisite_skill :weaponry, 2
  prerequisite_attribute :dexterity, 3
physical :fast_reflexes, 1..2
  prerequisite_attribute :dexterity, 3
physical :fighting_finesse, 2
  prerequisite_skill :weaponry, 2
  prerequisite_attribute :dexterity, 3
physical :fighting_style_boxing, 1..5
  prerequisite_skill :brawl, 2
  prerequisite_attribute :strength, 3
  prerequisite_attribute :stamina, 2
physical :fighting_style_kung_fu, 1..5
  prerequisite_skill :brawl, 2
  prerequisite_attribute :strength, 2
  prerequisite_attribute :stamina, 2
  prerequisite_attribute :dexterity, 2
physical :fighting_style_two_weapons, 1..4
  prerequisite_skill :weaponry, 3
  prerequisite_attribute :dexterity, 3
physical :fleet_of_foot, 1..3
  prerequisite_attribute :strength, 2
physical :fresh_start, 1
  prerequisite_merit :fast_reflexes, 2
physical :giant, 4
physical :gunslinger, 3
  prerequisite_skill :firearms, 3
  prerequisite_attribute :dexterity, 3
physical :iron_stamina, 1..3
  prerequisite_one_of {
    prerequisite_attribute :stamina, 3
    prerequisite_attribute :resolve, 3
  }
physical :iron_stomach, 2
  prerequisite_attribute :stamina, 2
physical :natural_immunity, 1
  prerequisite_attribute :stamina, 2
physical :quick_draw, 1
  prerequisite_attribute :dexterity, 3
physical :quick_healer, 4
  prerequisite_attribute :stamina, 4
physical :strong_back, 1
  prerequisite_attribute :strength, 2
physical :strong_lungs, 3
  prerequisite_skill :athletics, 3
physical :stunt_driver, 3
  prerequisite_attribute :dexterity, 3
physical :toxin_resistance, 2
  prerequisite_attribute :stamina, 3
physical :weaponry_dodge, 1
  prerequisite_attribute :strength, 2
  prerequisite_skill :weaponry, 1

  
social :allies, 1..5
social :barfly, 1
social :contacts, 1..5
social :fame, 1..3
social :inspiring, 4
  prerequisite_attribute :presence, 4
social :mentor, 1..5
social :resources, 1..5
social :retainer, 1..5
social :status, 1..5, :specialized => true
  specialization :police
  specialization :religion
    prerequisite_skill_specialization :academics, :religion
  specialization :corporate
  specialization :diplomat
    prerequisite_skill :politics, 2
    prerequisite_skill :persuasion, 2
  specialization :private_investigator
    prerequisite_skill_specialization :academics, :law
  specialization :demolitions_contractor
    prerequisite_skill_specialization :science, :demolitions
  specialization :medical
    prerequisite_skill :medicine, 2
  specialization :military
  specialization :rotary_club
  
  
    
social :striking_looks, [2, 4]
