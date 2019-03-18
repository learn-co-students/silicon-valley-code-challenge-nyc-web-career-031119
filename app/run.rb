require_relative './models/funding_round.rb'
require_relative './models/startup.rb'
require_relative './models/venture_capitalist.rb'


# startups
aapl = Startup.new('apple','steve jobs', 'tech')
amzn = Startup.new('amazon','jeff bezos', 'tech')
fb = Startup.new('facebook','mark zuck', 'tech')
goog = Startup.new('google','larry page', 'tech')
tsla = Startup.new('tesla','elon musk', 'auto')
nio = Startup.new('nio','william li', 'auto')
acb = Startup.new('aurora cannabis','terry booth', 'life sci')
allo = Startup.new('allogene','belldegrun', 'life sci')

# vc's
accel = VentureCapitalist.new('accel', 14092873451)
sequoia = VentureCapitalist.new('sequoia', 11384952019)
kleiner = VentureCapitalist.new('kleiner', 9592348360)
benchmark = VentureCapitalist.new('benchmark', 5931230524)
greylock = VentureCapitalist.new('greylock', 1492506394)
andreessen = VentureCapitalist.new('andreessen', 912123004)
bessemer = VentureCapitalist.new('bessemer', 894592482)

# funding
aapl.sign_contract(accel, 'series c', 50000000)
amzn.sign_contract(sequoia, 'series b', 35000000)
goog.sign_contract(accel, 'series d', 50000000)
fb.sign_contract(benchmark, 'series a', 5000000)
tsla.sign_contract(greylock, 'series b', 10000000)
allo.sign_contract(kleiner, 'series c', 10000000)
acb.sign_contract(accel, 'seed', 5000000)

kleiner.offer_contract(acb, 'series a', 25000000)
benchmark.offer_contract(allo, 'series a', 15000000)
andreessen.offer_contract(tsla, 'seed', 10000000)
greylock.offer_contract(fb, 'series c', 40000000)
accel.offer_contract(amzn, 'series b', 50000000)
sequoia.offer_contract(fb, 'series d', 30000000)
sequoia.offer_contract(goog, 'series d', 50000000)
bessemer.offer_contract(amzn, 'series d', 10000000)
bessemer.offer_contract(acb, 'seed', 5000000)
kleiner.offer_contract(nio, 'seed', 30000000)
benchmark.offer_contract(nio, 'seed', 15000000)
andreessen.offer_contract(nio, 'seed', 20000000)
