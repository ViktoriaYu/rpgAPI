class Player < SmartEntity
  attr_accessor :Name, :ID

  def initialize(init_maxHP, init_AD, init_AP, init_Armor, init_mResist, init_spd, init_SP, init_SL, init_Weap, init_Name, init_ID)
    super(init_maxHP, init_AD, init_AP, init_Armor, init_mResist, init_spd, init_SP, init_SL, init_Weap)
    @Name = init_Name
    @ID = init_ID
  end
end
