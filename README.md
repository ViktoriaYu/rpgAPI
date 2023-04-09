# rpgAPI

This gem allows you to create small rpg games. You can  customize enemies,
weapons and spells.

## Installation
Install the gem and add to the application's Gemfile by executing:

    $ bundle add rpgAPI

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rpgAPI

## Usage

You can you create player with 
```ruby
Player.create(name, maxHP, AD, AP, Armor, mResist, speed, SpellList, Weapon)
```

NPC can be created with
```ruby
NPC.create(name, maxHP, AD, AP, Armor, mResist, speed, SpellList, Weapon)
```

You can you create weapon with
```ruby
Weapon.create(name, AD)
```

You create Spell and customize it's behavior by passing onUse callback to constructor

```ruby

def onUse(Target, AD, AP)
  Target.takeDamage(AD  + AP)
end

Spell.create(name, onUse)
```

To start battle just call  startBattle and pass player and enemy objects to it.

```ruby
rpgApi.startBattle(player, enemy)
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
