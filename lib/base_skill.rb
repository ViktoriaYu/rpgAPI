# frozen_string_literal: true

module Game
  class BaseSkill
    attr_reader :name, :func, :cost, :dmg

    def initialize(name, cost, func)
      @name = name
      @cost = cost
      @func = func
    end

    def use(user, target)
      print "#{user.name} uses #{@name} on #{target.name}\n"
      @func.call(user, target)
    end
  end
end
