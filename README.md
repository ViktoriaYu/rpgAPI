# rpgAPI

This gem allows you to create small rpg games. You can  customize enemies,
weapons, statuses and skills.

## Installation

Download source code from github

In project's root directory run
    
    $ bundle install
    $ rake install

## Usage

First add dependency to your Gemfile

```ruby
  gem 'rpgAPI'
```

Then require library with 
```ruby
  require 'rpgAPI'
```

You can you create weapon with
```ruby
  sword  = Game::Weapon.new(name, attack_damage_coef)
```

You can create Status 
```ruby
  burn = Game::Status.new(tick_count, tick_func) 
```



You can create Skill and customize it's behavior by passing function(skill_effect) to constructor
```ruby
  fireball = Game::BaseSkill.new(display_name, skill_tags, skill_cost, skill_effect)
```


To create game entity and customize it's behaviour inherit from Game::SmartEntity
```ruby

class Swordsman < Game::SmartEntity
  def initialize(name, team, weapon)
    super(name, team, 20, 20, 10, weapon)
  end

  def take_turn
    super # you must call super first
    debuffskill = get_random_skill(:debuff_skill)
    if @mana >= debuffskill.cost
      use_skill(debuffskill, $entities.select { |e| e.team != @team }.sample)
    else
      attack($entities.select { |e| e.team != @team }.sample)
    end
  end
end


swordsman = Swordsman.new("Alehandro", :team2, sword)
```

To start a battle just call  Game::battle and all entity that you've created will start the battle.

```ruby
Game::battle
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
