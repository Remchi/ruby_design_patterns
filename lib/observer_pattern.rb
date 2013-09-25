require 'observer'

class Tile
  include Observable

  def initialize(attrs = {})
    @cursed = attrs.fetch(:cursed, false)
  end

  def cursed?
    @cursed
  end

  def activate_curse
    changed
    notify_observers
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
      tile.add_observer(self)
    end
  end

  def update
    damage(4)
  end

end