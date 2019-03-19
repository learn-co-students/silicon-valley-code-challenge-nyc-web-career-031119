class VentureCapitalist
  @@all = []

  attr_accessor :name, :total_worth

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    VentureCapitalist.all.select do |vc|
      vc.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |round|
      round.startup
    end
  end

  def biggest_investment
    biggest = nil
    funding_rounds.each do |round|
      if biggest == nil
        biggest = round
      elsif round.investment > biggest.investment
        biggest = round
      end
    end
    biggest
  end

  def invested(domain)
    funding_rounds.select do |round|
      round.startup.domain == domain
    end.map do |rnd|
      rnd.investment
    end.inject(:+)
  end






end
