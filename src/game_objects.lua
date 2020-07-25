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
      defaultState = 'dropped',
      states = {
          ['dropped'] = {
              frame = 111
          }
      }
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
