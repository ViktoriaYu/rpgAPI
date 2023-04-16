# frozen_string_literal: true

module Game
  $entities = []

  class Entity
    attr_accessor :name, :team, :current_hp, :maximum_hp, :attack_damage, :ability_power, :armor, :magic_resist,
                  :speed, :statuses

    # @param [String] name
    # @param [Integer] strength
    # @param [Integer] agility
    # @param [Integer] intelligence
    # @param [Symbol] team
    def initialize(name, team, strength, agility, intelligence)
      raise ArgumentError, "Strength stats can't be negative" if strength.negative?
      raise ArgumentError, "Agility stats can't be negative" if agility.negative?
      raise ArgumentError, "Intelligence stats can't be negative" if intelligence.negative?

      @name = name
      @team = team
      @maximum_hp = (20 * strength).to_f
      @current_hp = maximum_hp
      @attack_damage = strength.to_f
      @ability_power = intelligence.to_f
      @armor = (agility / 6).to_f
      @magic_resist = ((strength + intelligence) / 12).to_f
      @speed = agility
      @statuses = []
      $entities.push(self)
    end

    # @param [Float] amount
    # @param [Symbol] type
    def take_damage(amount, type)
      raise ArgumentError, "Can't deal negative damage!" if amount.negative?

      case type
      when :physical
        damage = (
          if @armor >= 0
            amount * 100.0 / (100 + @armor)
          else
            amount * (2 - 100.0 / (100 - @armor))
          end).to_f
      when :magic
        damage = (
          if @magic_resist >= 0
            amount * 100.0 / (100 + @magic_resist)
          else
            amount * (2 - 100.0 / (100 - @magic_resist))
          end).to_f
      when :pure
        damage = amount.to_f
      else
        raise ArgumentError, 'Unknown damage type'
      end

      @current_hp -= damage
      print "#{@name} takes #{damage.round(1)} #{type} damage\n"
    end

    # @param [Float] amount
    def heal(amount)
      raise ArgumentError, "Can't heal negative amount of hp" if amount.negative?

      @current_hp += amount
      @current_hp = @maximum_hp if @current_hp > @maximum_hp
      print "#{@name} heals for #{amount} hp\n"
    end

    def die
      $entities.delete(self)
      print "#{@name} is dead!\n"
    end

    def add_status(status)
      @statuses.push([status, status.duration])
    end

    def take_turn
      die if @current_hp <= 0
      # p @statuses
      @statuses.select! { |s| (s[1]).positive? }
      @statuses.each do |s|
        s[0].tic(self, s[1])
        s[1] -= 1
      end
    end
  end
end
