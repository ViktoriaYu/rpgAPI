# frozen_string_literal: true

module Game
  def turn(entity1, entity2)
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

  def display_hp2(entity1, entity2)
    print format("⌈%19s⌉    ⌈%19s⌉\n", entity1.name, entity2.name)
    print format("⌊mana %14d⌋    ⌊mana %14d⌋\n", entity1.mana, entity2.mana)
    white_hearts1 = (entity1.current_hp / entity1.maximum_hp * 10).round
    white_hearts2 = (entity2.current_hp / entity2.maximum_hp * 10).round
    print '♥' * [white_hearts1, 0].max, '♡' * [10 - white_hearts1, 10].min, format('%5d/%5d    ', entity1.current_hp, entity1.maximum_hp)
    print '♥' * [white_hearts2, 0].max, '♡' * [10 - white_hearts2, 10].min, format("%5d/%5d\n", entity2.current_hp, entity2.maximum_hp)
  end

  def battle2(entity1, entity2)
    print "starting battle between #{entity1.name} and #{entity2.name}...\n"
    display_hp2(entity1, entity2)
    turn_count = 1

    while entity1.current_hp.positive? && entity2.current_hp.positive?
      print "turn #{turn_count}\n"
      turn(entity1, entity2)

      display_hp2(entity1, entity2)
      turn_count += 1
    end

    print "🏵 #{entity2.name} won!🏵\n" if entity1.current_hp <= 0
    print "🏵 #{entity1.name} won!🏵\n" if entity2.current_hp <= 0

  end

  def battle
    $entities.sort
    $entities.each { |entity| entity.take_turn }
  end
end
