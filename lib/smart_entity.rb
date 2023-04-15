module Game
  class SmartEntity < Entity
    attr_reader :mana, :skill_list
    attr_accessor :team

    # @param [String] name
    # @param [Integer] strength
    # @param [Integer] agility
    # @param [Integer] intelligence
    # @param [Weapon] weapon
    def initialize(name, strength, agility, intelligence, weapon)
      super(name, strength.to_i, agility.to_i, intelligence.to_i)

      @weapon = weapon
      @mana = (12 * @ability_power).to_i
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


    # @param [Class] type
    def get_random_skill(type)
      if type <= BaseSkill
        @skill_list.select { |skill| skill.is_a?(type) }.sample
      else
        raise ArgumentError.new  "#{type} isn't a skill!"
      end
    end

    def learn_skills(*skills)
      skill_list.push(*skills)
    end

  end
end