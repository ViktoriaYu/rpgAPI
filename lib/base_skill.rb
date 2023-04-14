# frozen_string_literal: true
module Game
  class BaseSkill
    attr_reader :name, :func, :cost, :dmg

    def initialize(name, cost, func)
      @name = name
      @cost = cost
      @func = func
    end

    def use(target, attack_damage, ability_power)
      print "uses #{@name} on #{target.name}\n"
      @func.call(target, attack_damage, ability_power)
    end

  end
end