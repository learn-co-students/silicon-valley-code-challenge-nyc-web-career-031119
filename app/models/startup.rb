class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder_name)
    self.all.find do |startup|
      startup.founder == founder_name
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end.uniq
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def startupfundinground
    FundingRound.all.select do |round|
      round.startup == self
    end
  end

  def num_funding_rounds
    startupfundinground.count do |round|
      round.startup == self
    end
  end

  def total_funds
    startupfundinground.inject(0) do |sum, round|
      sum + round.investment
    end
  end

  def investors
    startupfundinground.map do |round|
      round.venturecapitalist
    end.uniq
  end

  def big_investors
    investors.select do |investor|
      investor.total_worth > 1000000000
    end
  end

end
