# frozen_string_literal: true
class Spell

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def use(target, attack_damage, ability_power); end
end

