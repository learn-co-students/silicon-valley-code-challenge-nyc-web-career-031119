require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


# startup instances
fyre = Startup.new("fyre", "Tim", "The Carribean")
boatsfest = Startup.new("boatsfest", "Jim", "The Ozarks")
pied_piper = Startup.new("Pied Piper", "Richard", "redwood city")
desk_co = Startup.new("Desk Company", "Jared", "Madison")

#venture capitalist instances
steve = VentureCapitalist.new("rich steve", 100)
boy = VentureCapitalist.new("rich boy", 500)
hammond = VentureCapitalist.new("Russ", 1300000)
tim = VentureCapitalist.new("Tall Tim", 40000)

#funding round instances
fyre_steve = FundingRound.new(fyre, steve, "series a", 20)
boatsfest_rich_boy = FundingRound.new(boatsfest, boy, "series b", 35)
pied_hammond = FundingRound.new(pied_piper, hammond, "series a", 25)
fyre_tim = FundingRound.new(fyre, tim, "series b", 65)
desk_co_steve = FundingRound.new(desk_co, steve, "series a", 80)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
