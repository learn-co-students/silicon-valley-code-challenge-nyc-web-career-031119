class Startup

  attr_accessor :name, :founder, :domains
  attr_reader :domain
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @domains << domain
    @@all << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_founder(name)
    all.select do |startup|
      startup.name == name
    end
  end

  def self.domains
    @domains
  end

  def self.all
    @@all
  end
end
