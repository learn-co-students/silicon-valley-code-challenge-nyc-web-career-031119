class VentureCapitalist
  attr_reader :name
  attr_accessor :total_worth

  @@all = []
  @portfolio = []
  @total_invested = 0

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    all.select do
      |vc| vc.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
    @portfolio << startup
    self.total_invested += investmnet
  end

  def funding_rounds
    FundingRound.all.select do
      |round| round.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map { |rounds| rounds.startup  }.uniq
  end

  def biggest_investment
    funding_rounds.sort_by{|round| round.investment}[-1].investment.to_f
  end

  def invested(domain)
      funding_rounds.select{|round| round.startup.domain == domain}.map{|round| round.investment}.reduce(:+).to_f
  end
end
