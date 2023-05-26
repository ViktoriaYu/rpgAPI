# frozen_string_literal: true

require_relative '../lib/rpgAPI'
require 'test/unit'
include Game


class TestUseSkill < Test::Unit::TestCase
  def test_enough_mana
    weapon_test = Weapon.new('Test Weapon', 2)
    attacking_entity = SmartEntity.new('Attacking', :team1, 5, 0, 10, weapon_test)
    target_entity = Entity.new('Target', :team2, 5, 12, 0)
    skill_test = BaseSkill.new('Test Skill', :test_skill, 50, Proc.new { |user, target| target.take_damage(1.0 * user.ability_power, :magic) })
    attacking_entity.use_skill(skill_test, target_entity)
    assert_equal 70, attacking_entity.mana
  end

  def test_not_enough_mana
    weapon_test = Weapon.new('Test Weapon', 2)
    attacking_entity = SmartEntity.new('Attacking', :team1, 5, 0, 10, weapon_test)
    target_entity = Entity.new('Target', :team2, 5, 12, 0)
    skill_test = BaseSkill.new('Test Skill', :test_skill, 150, Proc.new { |user, target| target.take_damage(1.0 * user.ability_power, :magic) })
    attacking_entity.use_skill(skill_test, target_entity)
    assert_equal 120, attacking_entity.mana
  end
end
