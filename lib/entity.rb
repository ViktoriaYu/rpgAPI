# frozen_string_literal: true

$Entities = []

class Entity
  attr_accessor :name, :team, :current_hp, :maximum_hp, :attack_damage, :ability_power, :armor, :magic_resist, :speed, :statuses


  def initialize(name, team, strength, agility, intelligence)
    @name = name
    @team = team
    @maximum_hp = 20 * strength
    @current_hp = 20 * strength
    @attack_damage = strength
    @ability_power = intelligence
    @armor = agility / 6
    @magic_resist = (strength + intelligence) / 12
    @speed = agility
    @statuses = []
    $Entities.push(self)
  end

  def take_damage(amount, type)

    if amount<0
      raise ArgumentError.new "Can't deal negative damage!"
    end

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
    else
      raise ArgumentError("Unknown damage type")
    end

    @current_hp -= damage
    print "#{@name} takes #{damage.round(1)} #{type} damage\n"
  end

  def heal(amount)

    if amount <0
      raise ArgumentError.new "Can't heal negative amount of hp"
    end

    @current_hp += amount
    @current_hp = @maximum_hp if @current_hp > @maximum_hp
    print "#{@name} heals for #{amount} hp\n"
  end

  def add_status(status)
    @statuses.push([status, status.duration])
  end

  def take_turn
    #p @statuses
    @statuses.select! {|s| s[1] > 0}
    @statuses.each{|s| s[0].tic(self, s[1]); s[1]-=1}
  end

end

