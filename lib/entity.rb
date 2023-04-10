# frozen_string_literal: true

class Entity
  attr_accessor :current_hp, :max_hp, :attack_damage, :ability_power, :armor, :magic_resist, :speed

  def initialize(max_hp, attack_damage, ability_power, armor, magic_resist, speed)
    @current_hp = max_hp
    @max_hp = max_hp
    @attack_damage = attack_damage
    @ability_power = ability_power
    @armor = armor
    @magic_resist = magic_resist
    @spd = speed
  end

  def take_damage(amount, type)
    @current_hp -= amount
  end
end
