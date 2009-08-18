# This file contains some rules information which you can fiddle with.

SKILL_STARTING_POINTS       = [11, 7, 3]
SKILLS_STARTING_POINT_COST  = [0, 1, 2, 03, 04, 06]
SKILL_XP_COSTS              = [0, 3, 9, 18, 30, 45]

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

SKILLS_BY_TYPE = [MENTAL_SKILLS, 
                  PHYSICAL_SKILLS, 
                  SOCIAL_SKILLS]

SKILLS = SKILLS_BY_TYPE.flatten
