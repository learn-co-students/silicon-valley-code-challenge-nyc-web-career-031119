
class Startup
  attr_accessor :domain
  attr_reader :name, :founder
  @@all = []

def initialize(name, founder, domain)
  @name = name
  @founder = founder
  @domain = domain
  @@all << self
end

def pivot(name, domain)
  @name = name
  @domain = domain
end

def self.all
  @@all
end

def self.find_by_founder(founder_name)
  Startup.all.select {|instance| instance.founder == founder_name}
end

def self.domains
  Startup.all.map { |startups| startups.domain }
end

def sign_contract(venture_capitalist, type, investment)
  FundingRound.new(self, venture_capitalist, type, investment)
end

def num_funding_rounds
  FundingRound.all.select {|round| round.startup == self}.length
end

def total_funds
  FundingRound.all.map do |round|
    round.startup == self
    round.investment
  end.sum
end

def investors
  FundingRound.all.map do |round|
    round.startup == self
    round.venture_capitalist
  end
end

def big_investors
  self.investors.select do |investor|
    return investor if VentureCapitalist.tres_commas_club.include?(investor)
  end.uniq
end


end
