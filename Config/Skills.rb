# This file contains some rules information which you can fiddle with.

MENTAL_SKILLS =   [ "Academics", 
                    "Computer", 
                    "Crafts", 
                    "Investigation", 
                    "Medicine", 
                    "Occult", 
                    "Politics", 
                    "Science"]
PHYSICAL_SKILLS = [ "Athletics", 
                    "Brawl", 
                    "Drive",
                    "Firearms",
                    "Larceny",
                    "Stealth",
                    "Survival",
                    "Weaponry"]
SOCIAL_SKILLS =   [ "Animal Ken", 
                    "Empathy", 
                    "Expression",
                    "Intimidation",
                    "Persuasion",
                    "Socialize",
                    "Streetwise",
                    "Subterfuge"]

SKILLS_BY_TYPE = [MENTAL_SKILLS, 
                  PHYSICAL_SKILLS, 
                  SOCIAL_SKILLS]

SKILLS = SKILLS_BY_TYPE.flatten
