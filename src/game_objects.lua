--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    ['pot'] = {
      type = 'pot',
      texture = 'pots',
      frame = 111,
      width = 16,
      height = 16,
      solid = false,
      consumable = false,
      consumed = false,
      defaultState = 'dropped',
      collidable = true,
      projectile = false,
      states = {
          ['dropped'] = {
            frame = 111
          },
          ['lifted'] = {
            frame = 111
          },
          ['throwing'] = {
            frame = 111
          },
          ['thrown'] = {
            frame = 111
          },
          ['broken'] = {
            frame = 111
          },

      },
      throw = function(object, player)
        object.state = "thrown"
        local throw_distance = 4 * TILE_SIZE
        local dx, dy

        if player.direction == 'right' then dx, dy = throw_distance, 0
        elseif player.direction == 'left' then dx, dy = -throw_distance, 0
        elseif player.direction == 'up' then dx, dy = 0, -throw_distance
        else dx, dy = 0, throw_distance end

        Timer.tween(.5, {
            [object] = {x = object.x + dx, y = object.y + dy}
        }):finish(function()
          object.state = 'broken'
        end)

      end
    },
    ['heart'] = {
      type = 'heart',
      texture = 'hearts',
      frame = 5,
      width = 16,
      height = 16,
      solid = false,
      defaultState = 'displayed',
      collidable = true,
      consumable = true,
      consumed = false,
      states = {
          ['displayed'] = {
              frame = 5
          },
      },

      onCollide = function(object, player)
        if collidable ~= false then
          if player.health <= 4 then
            player.health = player.health + 2
          elseif player.health == 5 then
            player.health = player.health + 1
          end
        end

        collidable = false

        return true
      end
    },
}
