# This file contains some rules information which you can fiddle with.
ATTRS_STARTING_POINTS     = [5, 4, 3]
ATTRS_STARTING_POINT_COST = [0, 0, 01, 02, 03, 05]
ATTR_XP_COSTS             = [0, 5, 15, 30, 50, 75]
MENTAL_ATTRS              = [:intelligence, :wits, :resolve]
PHYSICAL_ATTRS            = [:strength, :dexterity, :stamina]
SOCIAL_ATTRS              = [:presence, :manipulation, :composure]

ATTRS_BY_TYPE = [ MENTAL_ATTRS, 
                  PHYSICAL_ATTRS, 
                  SOCIAL_ATTRS]

ATTRS = ATTRS_BY_TYPE.flatten