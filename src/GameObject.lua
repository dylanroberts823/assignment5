--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    -- default empty collision callback
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> acd15c6797d759698975a21f9a0eb7075eab4b12
    if def.onCollide == nil then self.onCollide = function() end
    else self.onCollide = def.onCollide end

    if def.consumable == nil then self.consumable = function() end
    else self.consumable = def.consumable end
<<<<<<< HEAD
=======
=======
    self.onCollide = def.onCollide or function() end
    self.collidable = def.collidable or false
>>>>>>> fdbbe0ba2fef7c6c988cc113d269b3ef5329d167
>>>>>>> acd15c6797d759698975a21f9a0eb7075eab4b12
end

function GameObject:update(dt)

end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
end
