require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Startup
boingo = Startup.new("Boingo", "Mr. Pebblerot", "Tech")
tech_tongues = Startup.new("tech tongues", "Scott Sweatpants", "Tech")
mr_hollywood = Startup.new("Mr. Hollywood", "Sarah Stutterbottom", "Travel")

#venture_capitalist
warren = VentureCapitalist.new("Warren", 10000000000)
two_chains = VentureCapitalist.new("2Chainz", 900)
basos = VentureCapitalist.new("El Jeffe Basos", 50000000000)

basos.offer_contract(tech_tongues, "Angel", 400000)
basos.offer_contract(tech_tongues, "Angel", 99999999999999)

#FundingRound
boingo.sign_contract(two_chains, "Angel", 100000)
boingo.sign_contract(basos, "Angel", 500000)
boingo.sign_contract(basos, "Angel", 10000)
# boingo.FundingRound.new(boingo, warren, "Angel", 100000)
# round_two = FundingRound.new(boingo, two_chains, "Pre-Seed", 50000)
# round_one_tt = FundingRound.new(tech_tongues, basos,"Angel", 6000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
