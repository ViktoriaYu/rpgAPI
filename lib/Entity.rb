class Entity
  attr_accessor :curHP, :maxHP, :AD, :AP, :Armor, :mResist, :spd

  def initialize(init_maxHP, init_AD, init_AP, init_Armor, init_mResist, init_spd)
    @curHP = init_maxHP
    @maxHP = init_maxHP
    @AD = init_AD
    @AP = init_AP
    @Armor = init_Armor
    @mResist = init_mResist
    @spd = init_spd
  end

  def take_damage(amount, type)
    curHP = curHP - amount
  end

end
