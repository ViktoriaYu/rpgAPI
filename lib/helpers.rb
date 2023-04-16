# frozen_string_literal: true

module Game
  def self.one_team_alive?
    team = $entities[0].team
    $entities.each { |entity| return false if entity.team != team }
    true
  end

  # @param [Entity] entity
  def self.display_hp(entity)
    print format("⌈%19s⌉\n", entity.name)
    print format("|mana %14d|\n", entity.mana)
    print format("⌊armor %13d⌋\n", entity.armor)
    white_hearts = (entity.current_hp / entity.maximum_hp * 10).round
    print '♥' * [white_hearts, 0].max, '♡' * [10 - white_hearts, 10].min, format("%5d/%5d\n", entity.current_hp, entity.maximum_hp)
  end

  def self.battle
    until one_team_alive?
      $entities.sort { |a, b| b.speed <=> a.speed }
      $entities.each { |entity| entity.take_turn }
      $entities.each { |entity| display_hp(entity) }
    end
  end
end
