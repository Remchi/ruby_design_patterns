class Tile
  attr_reader :cursed_creatures

  def initialize(attrs = {})
    @cursed = attrs.fetch(:cursed, false)
    @cursed_creatures = []
  end

  def add_cursed(creature)
    @cursed_creatures << creature
  end

  def cursed?
    @cursed
  end

  def activate_curse
    cursed_creatures.each { |creature| creature.damage(4)}
  end

end

class Hero
  attr_reader :health

  def initialize
    @cursed = false
    @health = 10
  end

  def damage(hit)
    @health -= hit
  end

  def cursed?
    @cursed
  end

  def discover(tile)
    if tile.cursed?
      @cursed = true
      tile.add_cursed(self)
    end
  end

end