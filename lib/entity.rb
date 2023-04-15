# frozen_string_literal: true
module Game

  $entities = []

  class Entity
    attr_reader :name, :current_hp, :maximum_hp, :attack_damage, :ability_power, :armor, :magic_resist, :speed
    attr_accessor :team

    # @param [String] name
    # @param [Integer] strength
    # @param [Integer] agility
    # @param [Integer] intelligence
    def initialize(name, strength, agility, intelligence)
      @name = name
      @maximum_hp = (20 * strength).to_f
      @current_hp = maximum_hp
      @attack_damage = strength.to_f
      @ability_power = intelligence.to_f
      @armor = (agility / 6).to_f
      @magic_resist = ((intelligence + strength) / 12).to_f
      @speed = agility
      $entities.push(self)
    end

    # @param [Float] amount
    # @param [Class] type
    def take_damage(amount, type)

      if amount < 0
        raise ArgumentError.new "Can't deal negative damage!"
      end

      case type
      when :physical
        damage = (if @armor >= 0
                   amount * 100.0 / (100 + @armor)
                 else
                   amount * (2 - 100.0 / (100 - @armor))
                 end).to_f
      when :magic
        damage = (if @magic_resist >= 0
                   amount * 100.0 / (100 + @magic_resist)
                 else
                   amount * (2 - 100.0 / (100 - @magic_resist))
                 end).to_f
      when :pure
        damage = amount.to_f
      else
        raise ArgumentError("Unknown damage type")
      end

      @current_hp -= damage
      print "#{@name} takes #{damage.round(1)} #{type} damage\n"
    end

    # @param [Float] amount
    def heal(amount)

      if amount < 0
        raise ArgumentError.new "Can't heal negative amount of hp"
      end

      @current_hp += amount
      @current_hp = @maximum_hp if @current_hp > @maximum_hp
      print "#{@name} heals for #{amount} hp\n"
    end

    def take_turn
      p '...'
    end

  end
end