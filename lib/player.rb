# frozen_string_literal: true
class Player < SmartEntity
  attr_accessor :name, :id

  def initialize(max_hp, attack_damage, ability_power, armor, magic_resist, speed, spell_points, spell_list, weapon, name, id)
    super(max_hp, attack_damage, ability_power, armor, magic_resist, speed, spell_points, spell_list, weapon)
    @name = name
    @id = id
  end
end
