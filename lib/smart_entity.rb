class SmartEntity < Entity
  attr_accessor :spell_points, :spell_list, :weapon

  def initialize(max_hp, attack_damage, ability_power, armor, magic_resist, speed, spell_points, spell_list, weapon)
    super(max_hp, attack_damage, ability_power, armor, magic_resist, speed)
    @spell_points = spell_points
    @spell_list = spell_list
    @weapon = weapon
  end

  def attack(target)
    target.take_damage(@attack_damage * @weapon.coefficient_attack_damage, :Pure)
  end

  def use_spell(target, spell)
    spell.use(target, @attack_damage, @ability_power)
  end
end
