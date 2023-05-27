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

  def self.display_all_stats
    $entities.each do |entity|
      print format("⌈%19s⌉    ", entity.name)
    end
    print "\n"
    $entities.each do |entity|
      print format("|mana %14d|    ", entity.mana)
    end
    print "\n"
    $entities.each do |entity|
      print format("|speed %13d|    ", entity.speed)
    end
    print "\n"
    $entities.each do |entity|
      print format("⌊armor %13d⌋    ", entity.armor)
    end
    print "\n"
    $entities.each do |entity|
      white_hearts = (entity.current_hp / entity.maximum_hp * 10).round
      print '♥' * [white_hearts, 0].max, '♡' * [10 - white_hearts, 10].min, format("%5d/%5d    ", entity.current_hp, entity.maximum_hp)
    end
    print "\n"
  end

  def self.battle
    battle_counter = 1
    $entities.sort! { |a, b| b.speed <=> a.speed }
    display_all_stats
    until one_team_alive?
      print '=' * 25 * $entities.count, "\n"
      print "turn ##{battle_counter}\n"
      print '=' * 25 * $entities.count, "\n"
      $entities.sort! { |a, b| b.speed <=> a.speed }
      $entities.each { |entity| if entity.current_hp.positive? && !one_team_alive? then entity.take_turn end; display_all_stats; if !(entity.current_hp.positive?) then entity.die end; print '-' * 25 * $entities.count, "\n";}
      #$entities.each { |entity| p entity.statuses }
      #display_all_stats
      battle_counter += 1
    end
  end
end
