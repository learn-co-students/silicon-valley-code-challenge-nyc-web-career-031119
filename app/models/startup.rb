class Startup
  @@all = []

  attr_accessor :name, :domain
  attr_reader :founder

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

  def self.find_by_founder(founder)
    Startup.all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
    Startup.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(vc, type, investment)
    FundingRound.new(self, vc, type, investment)
  end

  def rounds
    FundingRound.all.select do |round|
      round.startup == self
    end
  end

  def num_funding_rounds
    rounds.select do |round|
      round.startup == self
    end.count
  end

  def total_funds
    self.rounds.inject(0) do |sum, round|
      sum + round.investment
    end
  end

  def investors
    rounds.map do |round|
      round.venture_capitalist
    end.uniq
  end

  def big_investors
    investors.select do |investor|
      VentureCapitalist.tres_commas_club.include?(investor)
    end
  end

end
