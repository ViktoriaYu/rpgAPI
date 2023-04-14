class SmartEntity < Entity
  attr_reader :mana, :skill_list
  attr_accessor :team

  def initialize(name, magic_resist, strength, agility, intelligence, weapon)
    super(name, magic_resist, strength, agility, intelligence)
    @weapon = weapon
    @mana = 12 * @ability_power
    @skill_list = []
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
  def get_random_skill(type)
    @skill_list.select{|skill| skill.is_a?(type)}.sample
  end




  def learn_skills(*skills)
    skill_list.push(*skills)
  end

end
