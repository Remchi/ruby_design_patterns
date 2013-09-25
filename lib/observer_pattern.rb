class Tile

  def initialize(attrs = {})
    @cursed = attrs.fetch(:cursed, false)
    @hero = attrs.fetch(:hero, nil)
  end

  def cursed?
    @cursed
  end

  def activate_curse
    @hero.damage(4)
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
    @cursed = true if tile.cursed?
  end

end