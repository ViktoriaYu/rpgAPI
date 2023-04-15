# frozen_string_literal: true
module Game
  class BaseSkill
    attr_reader :name, :func, :cost, :dmg

    # @param [String] name
    # @param [Integer] cost
    # @param [Proc] func
    def initialize(name, cost, func)
      @name = name
      @cost = cost.to_i
      @func = func
    end

    # @param [Entity] target
    # @param [Float] attack_damage
    # @param [Float] ability_power
    def use(target, attack_damage, ability_power)
      print "uses #{@name} on #{target.name}\n"
      @func.call(target, attack_damage.to_f, ability_power.to_f)
    end

  end
end