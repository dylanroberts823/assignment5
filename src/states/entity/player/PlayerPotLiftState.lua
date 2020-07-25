PlayerPotLiftState = Class{__includes = BaseState}

function PlayerPotLiftState:init(player, dungeon)
  self.player = player
  self.dungeon = dungeon

  -- render offset for spaced character sprite
  self.player.offsetY = 5
  self.player.offsetX = 0

  -- create hitbox based on where the player is and facing
  local direction = self.player.direction

  local hitboxX, hitboxY, hitboxWidth, hitboxHeight

  if direction == 'left' then
      hitboxWidth = 8
      hitboxHeight = 16
      hitboxX = self.player.x - hitboxWidth
      hitboxY = self.player.y + 2
  elseif direction == 'right' then
      hitboxWidth = 8
      hitboxHeight = 16
      hitboxX = self.player.x + self.player.width
      hitboxY = self.player.y + 2
  elseif direction == 'up' then
      hitboxWidth = 16
      hitboxHeight = 8
      hitboxX = self.player.x
      hitboxY = self.player.y - hitboxHeight
  else
      hitboxWidth = 16
      hitboxHeight = 8
      hitboxX = self.player.x
      hitboxY = self.player.y + self.player.height
  end

  self.potHitbox = Hitbox(hitboxX, hitboxY, hitboxWidth, hitboxHeight)
  self.player:changeAnimation('pot-lift-' .. self.player.direction)
end

function PlayerPotLiftState:enter(params)
  -- restart sword swing animation
  self.player.currentAnimation:refresh()
end

function PlayerPotLiftState:update(dt)
  -- check if hitbox collides with any entities in the scene
  for k, object in pairs(self.dungeon.currentRoom.objects) do
      if object:collides(self.potHitbox) then
        if object.type == 'pot' then self.player.hasPot = true end
      end
  end

  if self.player.currentAnimation.timesPlayed > 0 then
      self.player.currentAnimation.timesPlayed = 0
      if not self.player.hasPot then self.player:changeState('idle')
      else self.player:changeState('pot-idle') end
  end
end

function PlayerPotLiftState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))

    -- debug for player and hurtbox collision rects
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.player.x, self.player.y, self.player.width, self.player.height)
    -- love.graphics.rectangle('line', self.swordHurtbox.x, self.swordHurtbox.y,
    --     self.swordHurtbox.width, self.swordHurtbox.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end
