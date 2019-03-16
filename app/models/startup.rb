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

  # HELPER METHOD
  def funding_rounds
    FundingRound.all.select do |round|
      round.startup == self
    end
  end

  def sign_contract(type, vc, investment)
    FundingRound.new(type, self, vc, investment)
  end

  def num_funding_rounds
    self.funding_rounds.count
  end

  def total_funds
    total = 0
    self.funding_rounds.each do |round|
      total += round.investment
    end
    total
  end

  def investors
    self.funding_rounds.map do |round|
      round.venture_capitalist
    end.uniq
  end

  def big_investors
    investors.select do |investor|
      VentureCapitalist.tres_commas_club.include?(investor)
    end
  end

  def self.find_by_founder(founder_name)
    @@all.find do |startup|
      startup.founder == founder_name
    end
  end

  def self.domains
    @@all.map do |startup|
      startup.domain
    end
  end

end
