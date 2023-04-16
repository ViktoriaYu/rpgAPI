module Game
  class SmartEntity < Entity
    attr_accessor :mana, :skill_list

    def initialize(name, team, strength, agility, intelligence, weapon)
      super(name, team, strength, agility, intelligence)
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
        skill.use(self, target)
        @mana -= skill.cost
      else
        print "not enough mana\n"
      end
    end


    def get_random_skill(type)
      @skill_list.select{|skill| skill.skill_type == type}.sample
    end

    def learn_skills(*skills)
      @skill_list.push(*skills)
    end
  end
end
