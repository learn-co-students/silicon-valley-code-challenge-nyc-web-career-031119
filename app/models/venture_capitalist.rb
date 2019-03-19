class VentureCapitalist

  attr_accessor :name, :net_worth
  @@all = []

  def initialize(name, net_worth)
    @name = name
    @net_worth = net_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |list|
    list.net_worth > 1000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def all_funding_rounds
    FundingRound.all
  end

  def funding_rounds
    all_funding_rounds.select do |list|
      list.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |list|
      list.startup
    end
  end

  def array_of_investment_nums
  funding_rounds.map do |list|
    list.investment
  end
end

  def biggest_investment
      funding_rounds.select do |list|
        list.investment == array_of_investment_nums.max
      end
  end

  def invested
    array_of_investment_nums.reduce(:+)
  end

end
