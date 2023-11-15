Bird = Class{}
local GRAVITY = - 200
function Bird:init(x, y)
    self.x = x
    self.y = y
    
    self.image = love.graphics.newImage('bird.png')
    self.width = 12
    self.height = 12
    
    self.dy = 0
end

function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt

  if love.keyboard.isDown('space') then
   self.y = self.y + 10 
   end
   self.y = self.y + self.dy * dt
end


function Bird:render()
love.graphics.draw(self.image, self.x, self.y, -180, 0.5, 0.5)
end