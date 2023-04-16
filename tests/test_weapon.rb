require '../lib/rpgAPI'
require 'test/unit'
include Game

class TestWeaponInitialize < Test::Unit::TestCase

    def test_negative_attack_damage_coef
        assert_raise(ArgumentError) do
            entity_test = Weapon.new("Tester", -3)
        end
    end

end