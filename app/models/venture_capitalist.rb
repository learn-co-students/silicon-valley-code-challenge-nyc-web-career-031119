class VentureCapitalist
  @@all = []

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select { |vc| vc.total_worth > 1000000000 }
  end

  attr_accessor :name, :total_worth

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |fr| fr.venture_capitalist == self }
  end

  def portfolio
    funding_rounds.map { |fr| fr.startup }.uniq
  end

  def biggest_investment
    funding_rounds.max_by { |fr| fr.investment }
  end

  def invested(domain)
    funding_rounds.select { |fr| fr.startup.domain == domain}.sum{|instance| instance.investment}
  end
end
