class FundingRound
  @@all = []

  def self.all
    @@all
  end

  attr_accessor :type, :investment
  attr_reader :startup, :venture_capitalist

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment
    @@all << self
  end

  def process_contract
  
  end


end
