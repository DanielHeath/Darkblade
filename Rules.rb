# This file contains some rules information which you can fiddle with.

ATTRS_STARTING_POINT_COST = [0, 0, 01, 02, 03, 05]
ATTR_XP_COSTS =             [0, 5, 15, 30, 50, 75]
MENTAL_ATTRS =              [:intelligence, :wits, :resolve]
PHYSICAL_ATTRS =            [:strength, :dexterity, :stamina]
SOCIAL_ATTRS =              [:presence, :manipulation, :composure]

ATTRS_BY_TYPE = [ MENTAL_ATTRS, 
                  PHYSICAL_ATTRS, 
                  SOCIAL_ATTRS]

ATTRS = ATTRS_BY_TYPE.flatten

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

SKILLS_BY_TYPE = [MENTAL_SKILLS, 
                  PHYSICAL_SKILLS, 
                  SOCIAL_SKILLS]

SKILLS = SKILLS_BY_TYPE.flatten