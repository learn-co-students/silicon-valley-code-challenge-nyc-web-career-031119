class Startup

  attr_accessor :name, :founder, :domain
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(new_name, new_domain)
    self.name = new_name
    self.domain = new_domain
    self
  end

  def self.find_by_founder(str)
    self.all.select do |list|
       list.founder == str  
    end
  end

  def self.domains
    self.all.map do |list|
      list.domain
    end
  end



end
