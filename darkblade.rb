require 'yaml'
require File.dirname(__FILE__) + "/Config/Constants.rb"
require File.dirname(__FILE__) + "/Config/Attributes.rb"
require File.dirname(__FILE__) + "/Config/Costs.rb"
require File.dirname(__FILE__) + "/Config/Skills.rb"


require File.dirname(__FILE__) + "/Model/Character/Character.rb"

require File.dirname(__FILE__) + "/Lib/Utils.rb"
require File.dirname(__FILE__) + "/View/Attributes.rb"
require File.dirname(__FILE__) + "/View/Skills.rb"
require File.dirname(__FILE__) + "/View/Specializations.rb"
require File.dirname(__FILE__) + "/View/Merits.rb"
require File.dirname(__FILE__) + "/View/Main.rb"




Shoes.app :title => "Darkblade", :width => APP_WIDTH, :height => 600
