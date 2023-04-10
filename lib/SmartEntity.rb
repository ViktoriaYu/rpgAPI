class SmartEntity < Entity
    attr_accessor :SpellPoints, :SpellList, :Weapon

    def initialize(init_maxHP, init_AD, init_AP, init_Armor, init_mResist, init_spd, init_SP, init_SL, init_Weap)
        super(init_maxHP, init_AD, init_AP, init_Armor, init_mResist, init_spd)
        @SpellPoints = init_SP
        @SpellList = init_SL
        @Weapon = init_Weap
    end

    def attack(target)
       target.take_damage(AD * Weapon.coefAD, :Pure) 
    end

    def useSpell(target, spell)
        spell.use(target, AD, AP)
    end
end