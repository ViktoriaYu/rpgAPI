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

end