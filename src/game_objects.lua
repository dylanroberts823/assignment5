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
        -- TODO
    },
    ['heart'] = {
      type = 'heart',
      texture = 'hearts',
      frame = 5,
      width = 16,
      height = 16,
      solid = false,
      consumable = true,
      defaultState = 'displayed',
      states = {
          ['displayed'] = {
              frame = 5
          },
      },

      onCollide = function(obj, player)
        --change the health
        if obj.consumed == false then
          if player.health <= 4 then player.health = player.health + 2
          elseif player.health == 5 then player.health = player.health + 1 end
          obj.consumed = true
        end
      end
    },
}
