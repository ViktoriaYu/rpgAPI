# frozen_string_literal: true
class BaseSkill
  attr_reader :name, :skill_type, :func, :cost, :dmg

  def initialize(name, skill_type, cost, func)
    @name = name
    @skill_type = skill_type
    @cost = cost
    @func = func
  end

  def use(user, target)
    print "#{user.name} uses #{@name} on #{target.name}\n"
    @func.call(user, target)
  end

end

