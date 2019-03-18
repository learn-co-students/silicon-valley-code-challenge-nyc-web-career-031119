class Startup
  attr_reader :founder
  attr_accessor :name, :domain

  @@all = []
  @@domain = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
    @@domain << domain
  end

  def pivot(domain, name)
    self.name = name
    self.domain = domain
    @@domain << domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    all.select do
      |startup| startup.founder == founder
    end
  end

  def self.domains
    @@domain.uniq
  end

  def sign_contract(vc, type, investment)
    FundingRound.new(self, vc, type, investment)
  end

  def rounds
    FundingRound.all.select do
      |round| round.startup == self
    end
  end

  def num_funding_rounds
    rounds.length
  end

  def total_funds
    rounds.map{ |round| round.investment }.reduce(:+).to_f
  end

  def investors
    rounds.map{ |round| round.venture_capitalist }.uniq
  end

  def big_investors
    investors.select do
      |vc| vc.total_worth > 1000000000
    end
  end
end
