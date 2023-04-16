# frozen_string_literal: true

module Game
  require 'set'

  class BaseSkill
    attr_reader :name, :tags, :func, :cost, :dmg

    # @param [String] name
    # @param [Set] tags
    # @param [Integer] cost
    # @param [Proc] func
    def initialize(name, tags, cost, func)
      raise ArgumentError, "Skill cost can't be negative!" if cost.negative?

      @name = name
      @tags = tags
      @cost = cost.to_i
      @func = func
    end

    def use(user, target)
      print "#{user.name} uses #{@name} on #{target.name}\n"
      @func.call(user, target)
    end
  end
end
