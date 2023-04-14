# frozen_string_literal: true
class Player < SmartEntity
  attr_accessor :id

  def initialize(name, team, maximum_hp, attack_damage, ability_power, armor, magic_resist, speed, weapon, mana, skill_list, id)
    super(name, team, maximum_hp, attack_damage, ability_power, armor, magic_resist, speed, weapon, mana, skill_list)
    @id = id
  end

end
