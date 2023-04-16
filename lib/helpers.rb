# frozen_string_literal: true

module Game
  def self.turn(entity1, entity2)
    if entity1.speed > entity2.speed
      print "#{entity1.name} moves... "
      entity1.take_turn
      return if entity2.current_hp <= 0

      print "#{entity2.name} moves... "
      entity2.take_turn
    elsif entity1.speed < entity2.speed
      print "#{entity2.name} moves... "
      entity2.take_turn
      return if entity1.current_hp <= 0

      print "#{entity1.name} moves... "
      entity1.take_turn
    elsif rand(1) == 1
      print "#{entity1.name} moves... "
      entity1.take_turn
      return if entity2.current_hp <= 0

      print "#{entity2.name} moves... "
      entity2.take_turn
    else
      print "#{entity2.name} moves... "
      entity2.take_turn
      return if entity1.current_hp <= 0

      print "#{entity1.name} moves... "
      entity1.take_turn
    end
  end

  def self.one_team_alive?
    team = $entities[0].team
    $entities.each {|entity| return false if entity.team != team}
    return true
  end

  def self.display_hp(entity)
    print format("⌈%19s⌉\n", entity.name)
    print format("|mana %14d|\n", entity.mana)
    print format("⌊armor %13d⌋\n", entity.armor)
    white_hearts = (entity.current_hp / entity.maximum_hp * 10).round
    print '♥' * [white_hearts, 0].max, '♡' * [10 - white_hearts, 10].min, format("%5d/%5d\n", entity.current_hp, entity.maximum_hp)
  end

  def self.battle
    while !one_team_alive?
      $entities.sort {|a, b| b.speed <=> a.speed}
      $entities.each { |entity| entity.take_turn }
      $entities.each { |entity| display_hp(entity) }
    end
  end
end
