require_relative '../lib/entity'
require 'test/unit'
include Game

class TestTakeDamage < Test::Unit::TestCase

    def test_negative_amount
        entity_test = Entity.new("Tester", 10, 12, 14)
        assert_raise(ArgumentError) do
            entity_test.take_damage(-10, :physical)
        end
    end

    def test_physical_positive_armor
        entity_test = Entity.new("Tester", 10, 12, 14)
        entity_test.take_damage(10, :physical)
        assert_in_delta 190.2, entity_test.current_hp, delta = 0.1
    end

    def test_physical_negative_armor
        entity_test = Entity.new("Tester", 10, -12, 14)
        entity_test.take_damage(10, :physical)
        assert_in_delta 189.8, entity_test.current_hp, delta = 0.1
    end

    def test_magic_positive_magic_resist
        entity_test = Entity.new("Tester", 10, 12, 14)
        entity_test.take_damage(10, :magic)
        assert_in_delta 190.2, entity_test.current_hp, delta = 0.1
    end

    def test_magic_negative_magic_resist
        entity_test = Entity.new("Tester", 10, 12, -14)
        entity_test.take_damage(10, :magic)
        assert_in_delta 190, entity_test.current_hp, delta = 0.1
    end

    def test_pure
        entity_test = Entity.new("Tester", 10, 12, 14)
        entity_test.take_damage(10.75, :pure)
        assert_equal 189.25, entity_test.current_hp
    end

    '''
    def test_unknown_type_of_damage
        entity_test = Entity.new("Tester", 10, 12, 14)
        assert_raise(ArgumentError) do
            entity_test.take_damage(10, :unknown)
        end
    end
    '''

end


class TestHeal < Test::Unit::TestCase

    def test_negative_amount
        entity_test = Entity.new("Tester", 10, 12, 14)
        assert_raise(ArgumentError) do
            entity_test.heal(-10)
        end
    end

    def test_current_hp_less_than_maximum_hp
        entity_test = Entity.new("Tester", 10, 12, 14)
        entity_test.take_damage(20, :pure)
        entity_test.heal(5.75)
        assert_equal 185.75, entity_test.current_hp
    end

    def test_current_hp_more_than_maximum_hp 
        entity_test = Entity.new("Tester", 10, 12, 14)
        entity_test.take_damage(20, :pure)
        entity_test.heal(20.75)
        assert_equal 200, entity_test.current_hp
    end

end