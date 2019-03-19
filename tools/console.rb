require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

ion = Startup.new("ion", "Alex", "education")
boast = Startup.new("boast", "Jaime", "social network")

vc1 = VentureCapitalist.new("Jake", 100000000)
vc2 = VentureCapitalist.new("Mary", 1000000003)

fr1 = FundingRound.new(ion, vc1, "angel", 1000)

ion.sign_contract(vc2, "seed", 500)
vc1.offer_contract(ion, "angel", 1500)
vc1.offer_contract(boast, "seed", 3000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
