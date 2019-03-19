require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

facebook = Startup.new("Facebook", "Mark", "Domain1")
yahoo = Startup.new("Yahoo", "Fillan", "Domain2")
flatiron = Startup.new("Flatiron", "Mark", "Domain2")

sam = VentureCapitalist.new("Sam", 1337)
liz = VentureCapitalist.new("Liz", 2000000000)
phil = VentureCapitalist.new("Phil", 3000000000)

fund1 = FundingRound.new(facebook, sam, "Angel", 1000)
fund2 = FundingRound.new(yahoo, liz, "Pre-Seed", 12314151)
fund3 = FundingRound.new(flatiron, phil, "Series A", 7654353)
fund4 = FundingRound.new(facebook, liz, "Series B", 2000)
fund5 = FundingRound.new(facebook, phil, "Series C", 987654)
fund6 = FundingRound.new(facebook, liz, "Series E", 20)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
