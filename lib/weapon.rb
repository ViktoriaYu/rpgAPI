module Game
class Weapon
  attr_reader :name, :attack_damage_coef

  # @param [String] name
  # @param [Float] attack_damage_coef
  def initialize(name, attack_damage_coef)
    @name = name
    @attack_damage_coef = attack_damage_coef.to_f
  end

end

end