class SmartEntity < Entity
  attr_reader :mana

  def initialize(name, team, magic_resist, strenght, agility, intelligence, weapon, skill_list)
    super(name, team, magic_resist, strenght, agility, intelligence)
    @weapon = weapon
    @mana = 12 * @ability_power
    @skill_list = skill_list
  end

  def attack(target)
    print "Attacks #{target.name}!\n"
    target.take_damage(@weapon.attack_damage_coef * @attack_damage, :physical)
  end

  def use_skill(skill, target)
    if @mana >= skill.cost
      skill.use(target, @attack_damage, @ability_power)
      @mana -= skill.cost
    else
      print "not enough mana\n"
    end
  end

  # def choose_random_skill(target)
  #   use_skill(target, @attack_damage, @ability_power)
  # end

  def get_random_heal_skill
    @skill_list.select{|skill| skill.skill_type == :heal_skill}.sample
  end

  def get_random_damage_skill
    @skill_list.select{|skill| skill.skill_type == :damage_skill}.sample
  end

end