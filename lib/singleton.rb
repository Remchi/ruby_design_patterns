class HeroFactory

  @@instance = nil

  def self.instance
    @@instance = HeroFactory.send(:new) unless @@instance
    @@instance
  end

  def create_warrior
    Warrior.new
  end

  def create_mage
    Mage.new
  end

  private_class_method :new
end