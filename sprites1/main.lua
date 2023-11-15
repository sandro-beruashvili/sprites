io.stdout:setvbuf('no')

push = require 'push'
Class = require 'class'
require 'Bird'

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720



background = love.graphics.newImage('background.png')
background_scroll = 0

BACKGROUND_SCROLL_SPEED = 70
LOOPING_POINT = 313

function love.load()
  
  math.randomseed(os.time())
  
  
  love.graphics.setDefaultFilter('nearest', 'nearest')


  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = true,
    vsync = true
  })

  bird = Bird(VIRTUAL_WIDTH /2 - 12, VIRTUAL_HEIGHT / 2 - 12)
end

function love.resize(width, height)
  push:resize(width, height)
end


function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
  
  
end

function love.update(dt)
 background_scroll = (background_scroll + BACKGROUND_SCROLL_SPEED * dt) % LOOPING_POINT
   bird:update(dt)
end


function love.draw()
  push:start()
  
  love.graphics.draw(background, -background_scroll, 0)
 bird:render()

  push:finish()
end
