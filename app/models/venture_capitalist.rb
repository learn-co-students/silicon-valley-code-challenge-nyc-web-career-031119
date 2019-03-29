class VentureCapitalist
  attr_accessor :name, :total_worth
  @@all = []

  def initialize(name)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.tres_commas_club
    all.map do |venture_capitalist|
      venture_capitalist.total_worth > 1000000000
    end.compact
  end

  def self.all
    @@all
  end
end
