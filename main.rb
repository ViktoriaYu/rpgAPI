require 'E:\rpgAPI\GIT\rpgAPI\lib\base_skill.rb'
require 'E:\rpgAPI\GIT\rpgAPI\lib\entity.rb'
require 'E:\rpgAPI\GIT\rpgAPI\lib\helpers.rb'
require 'E:\rpgAPI\GIT\rpgAPI\lib\smart_entity.rb'
require 'E:\rpgAPI\GIT\rpgAPI\lib\status.rb'
require 'E:\rpgAPI\GIT\rpgAPI\lib\weapon.rb'

burn = Status.new(3, Proc.new {|target, cur, dur| target.take_damage(10, :magic); p "burn tic!"})
bleeding = Status.new(3, Proc.new {|target, cur, dur| target.take_damage(10, :physical)})

lower_defence = Status.new(5, Proc.new {|target, cur, dur| if cur == dur then target.armor -= 10; p "lower armor"; elsif cur == 1 then target.armor += 10; p "return armor"; end })

fireball = BaseSkill.new('Fireball', :damage_skill, 50, Proc.new { |user, target| target.take_damage(1.0*user.ability_power, :magic); target.add_status(burn)})
healray = BaseSkill.new('Healray', :heal_skill, 10, Proc.new {|user, target| target.heal(1.4*user.ability_power)})
armor_gap = BaseSkill.new('Armor Gap', :debuff_skill, 100, Proc.new {|user, target| target.add_status(lower_defence)})

staff = Weapon.new('staff', 1.0)
sword = Weapon.new('sword', 1.2)

class Mage < SmartEntity
  def initialize(name, team, weapon)
    super(name, team, 20, 20, 20, weapon)
  end

  def take_turn
    super
    healskill = get_random_skill(:heal_skill)
    damageskill = get_random_skill(:damage_skill)
    if @current_hp < @maximum_hp/2 && @mana >= healskill.cost
      use_skill(healskill, self)
    elsif @mana >= damageskill.cost
      $Entities.each {|e| if e.team != @team then use_skill(damageskill, e); break; end}
    else
      $Entities.each {|e| if e.team != @team then attack(e); break; end}
    end
  end
end

class Swordsman < SmartEntity
  def initialize(name, team, weapon)
    super(name, team, 20, 20, 10, weapon)
  end

  def take_turn
    super
    debuffskill = get_random_skill(:debuff_skill)
    if @mana >= debuffskill.cost
      $Entities.each {|e| if e.team != @team then use_skill(debuffskill, e); break; end}
    else
      $Entities.each {|e| if e.team != @team then attack(e); break; end}
    end
  end
end

mage = Mage.new("Jacob", :team1, staff)
swordsman = Swordsman.new("Alehandro", :team2, sword)
mage.learn_skills(fireball, healray)
swordsman.learn_skills(armor_gap)

battle(mage, swordsman)
