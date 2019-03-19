class VentureCapitalist
  @@all = []
attr_accessor :name, :total_worth

def initialize(name, total_worth)
  @name = name
  @total_worth = total_worth
  @@all << self
end

def self.all
  @@all
end

def self.tres_commas_club
  	VentureCapitalist.all.select do |person|
		person.total_worth > 1000000000
  	end
end

def offer_contract(startup, type, investment)
	FundingRound.new(startup, self, type, investment)
end

def portfolio
	FundingRound.all.map do |round|
		round.venture_capitalist == self
		round.startup
	end.uniq
end

def biggest_investment
	FundingRound.all.max_by do |round|
		round.venture_capitalist == self
		round.investment
	end
end

def invested
		FundingRound.all.map do |round|
			round.venture_capitalist == self
				round.investment
		end.sum
	end
end
