local menu = require "menu"
local game = require "game"

function love.load()
    width, height = love.graphics.getWidth() , love.graphics.getHeight()
    
    gamestates = { "menu", "play", "exit" }
    currentstate = gamestates[2]
    menu.load()
    game.load()
end

function love.update(dt)
    if love.keyboard.isDown('escape') then currentstate = gamestates[3] end
    if currentstate == "menu" then menu.update(dt) end
    if currentstate == "play" then game.update(dt) end
    if currentstate == "exit" then love.event.quit() end
end

function love.draw()
    love.graphics.setColor(33, 22, 64, 255)
    love.graphics.rectangle('fill', 0, 0, width, height)
    love.graphics.print(game.score[1])
    if currentstate == "menu" then menu.draw() end

    if currentstate == "play" then game.draw() end
end