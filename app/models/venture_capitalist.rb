class VentureCapitalist
  attr_accessor :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    @@all.select do |vc|
      vc.total_worth > 1000000000
    end
  end

  def offer_contract(type, startup, investment)
    FundingRound.new(type, startup, self, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def portfolio
    self.funding_rounds.map do |round|
      round.startup
    end.uniq
  end

  def biggest_investment
    self.funding_rounds.sort_by! do |round|
      round.investment
    end.last
  end

  def funding_rounds_by_domain(domain)
    self.funding_rounds.select do |round|
      round.startup.domain == domain
    end
  end

  def invested(domain)
    funding_rounds_by_domain(domain).map do |round|
      round.investment
    end.sum
  end
end
