class VentureCapitalist

  attr_reader :name, :total_worth

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
    self.all.select do |billionaire|
      billionaire.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venturecapitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |round|
      round.startup
    end.uniq
  end

  def biggest_investment
    funding_rounds.max_by do |round|
      round.investment
    end
  end

  def invested(domain)
    amount = 0
    funding_rounds.each do |round|
      if round.startup.domain == domain
        amount += round.investment
      end
    end
    amount
  end

end
