class Startup
  attr_reader :founder, :domain
  attr_accessor :name

  @@all = []
  @@domain = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
    @@domain << domain
  end

  def pivot(domain, name)
    self.name = name
    self.domain = domain
    @@domain << domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    all.select do
      |startup| startup.founder == self.founder
    end
  end

  def self.domains
    @@domain.uniq
  end
end
