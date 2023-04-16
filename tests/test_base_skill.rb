# frozen_string_literal: true

require_relative '../lib/rpgAPI'
require 'test/unit'
include Game

class TestBaseSkillInitialize < Test::Unit::TestCase
  def test_negative_cost
    assert_raise(ArgumentError) do
      BaseSkill.new('Test Skill', :test_skill, -50, Proc.new { |user, target| target.take_damage(1.0 * user.ability_power, :magic) })
    end
  end
end
