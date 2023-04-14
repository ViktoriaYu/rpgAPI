# frozen_string_literal: true

$Entities = []

class Entity
  attr_reader :name, :team, :current_hp, :maximum_hp, :attack_damage, :ability_power, :armor, :magic_resist, :speed

  def initialize(name, team, magic_resist, strenght, agility, intelligence)
    @name = name
    @team = team
    @maximum_hp = 20 * strenght
    @current_hp = 20 * strenght
    @attack_damage = strenght
    @ability_power = intelligence
    @armor = agility / 6
    @magic_resist = magic_resist
    @speed = agility
    $Entities.push(self)
  end

  def take_damage(amount, type)
    case type
    when :physical
      damage = if @armor >= 0
                 amount * 100 / (100 + @armor)
               else
                 amount * (2 - 100 / (100 - @armor))
               end
    when :magic
      damage = if @magic_resist >= 0
                 amount * 100 / (100 + @magic_resist)
               else
                 amount * (2 - 100 / (100 - @magic_resist))
               end
    when :pure
      damage = amount
    end

    @current_hp -= damage
    print "#{@name} takes #{damage.round(1)} #{type} damage\n"
  end

  def heal(amount)
    @current_hp += amount
    @current_hp = @maximum_hp if @current_hp > @maximum_hp
    print "#{@name} heals for #{amount} hp\n"
  end

  def take_turn
    p '...'
  end

end

