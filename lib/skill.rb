# frozen_string_literal: true
class Skill
  attr_reader :name, :skill_type, :func, :cost, :dmg

  def initialize(name, skill_type, cost, func)
    @name = name
    @skill_type = skill_type
    @cost = cost
    @func = func
  end

  def use(target, attack_damage, ability_power)
    print "uses #{@name} on #{target.name}\n"
    @func.call(target, attack_damage, ability_power)
  end

end

