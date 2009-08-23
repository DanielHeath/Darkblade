mental "Common Sense", 4
mental "Danger Sense", 2
mental "Eidetic Memory", 2
mental "Encyclopedic Knowledge", 4
mental "Holistic Awareness", 3
mental "Language", 1..3, :specialized => true
mental "Meditative Mind", 1
mental "Unseen Sense", 3, :specialized => true
  prerequisite_faction "mortal"
  prerequisite_attribute "wits", 2
  
physical "Ambidextrous", 3
physical "Brawling Dodge", 1
  prerequisite_skill "brawl", 1
  prerequisite_attribute "strength", 2
physical "Direction Sense", 1
physical "Disarm", 2
  prerequisite_skill "weaponry", 2
  prerequisite_attribute "dexterity", 3
physical "Fast Reflexes", 1..2
  prerequisite_attribute "dexterity", 3
physical "Fighting Finesse", 2
  prerequisite_skill "weaponry", 2
  prerequisite_attribute "dexterity", 3
physical "Fighting Style: Boxing", 1..5
  prerequisite_skill "brawl", 2
  prerequisite_attribute "strength", 3
  prerequisite_attribute "stamina", 2
physical "Fighting Style: Kung Fu", 1..5
  prerequisite_skill "brawl", 2
  prerequisite_attribute "strength", 2
  prerequisite_attribute "stamina", 2
  prerequisite_attribute "dexterity", 2
physical "Fighting Style: Two Weapons", 1..4
  prerequisite_skill "weaponry", 3
  prerequisite_attribute "dexterity", 3
physical "Fleet of Foot", 1..3
  prerequisite_attribute "strength", 2
physical "Fresh Start", 1
  prerequisite_merit "fast_reflexes", 2
physical "Giant", 4
physical "Gunslinger", 3
  prerequisite_skill "firearms", 3
  prerequisite_attribute "dexterity", 3
physical "Iron Stamina", 1..3
  prerequisite_one_of {
    prerequisite_attribute "stamina", 3
    prerequisite_attribute "resolve", 3
  }
physical "Iron Stomach", 2
  prerequisite_attribute "stamina", 2
physical "Natural Immunity", 1
  prerequisite_attribute "stamina", 2
physical "Quick Draw", 1
  prerequisite_attribute "dexterity", 3
physical "Quick Healer", 4
  prerequisite_attribute "stamina", 4
physical "Strong Back", 1
  prerequisite_attribute "strength", 2
physical "Strong Lungs", 3
  prerequisite_skill "athletics", 3
physical "Stunt Driver", 3
  prerequisite_attribute "dexterity", 3
physical "Toxin Resistance", 2
  prerequisite_attribute "stamina", 3
physical "Weaponry Dodge", 1
  prerequisite_attribute "strength", 2
  prerequisite_skill "weaponry", 1

social "Allies", 1..5
social "Barfly", 1
social "Contacts", 1..5
social "Fame", 1..3
social "Inspiring", 4
  prerequisite_attribute "presence", 4
social "Mentor", 1..5
social "Resources", 1..5
social "Retainer", 1..5
social "Status: Other", 1..5, :specialized => true
social "Status: Police", 1..5
social "Status: Religion", 1..5
  prerequisite_skill_specialization "academics", "religion"
social "Status: Corporate", 1..5
social "Status: Diplomat", 1..5
  prerequisite_skill "politics", 2
  prerequisite_skill "persuasion", 2
social "Status: Private Investigator", 1..5
  prerequisite_skill_specialization "academics", "Law"
social "Status: Demolitions Contractor", 1..5
  prerequisite_skill_specialization "science", "Demolitions"
social "Status: Medical", 1..5
  prerequisite_skill "medicine", 2
social "Status: Military", 1..5
social "Status: Rotary Club", 1..5
social "Striking Looks", [2, 4]