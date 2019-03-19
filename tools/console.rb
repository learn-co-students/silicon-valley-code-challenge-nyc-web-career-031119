require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

gold = Startup.new("Gold Team", "Danny Martin", "Slaggin' counterfeit textbooks")
flatiron = Startup.new("FlatIron School", "Bob Barker", "Teaching aerobic exercises")
bobby = VentureCapitalist.new("Bobby B", 1200000000)
steve = VentureCapitalist.new("Scuba Steve", 40)
howard = VentureCapitalist.new("Howard",999999999999999)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
