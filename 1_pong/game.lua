local game = {}
window = { width = love.graphics.getWidth(), height = love.graphics.getHeight() }
board = { topleft = {x=0, y=0},
        topright = {x=window.width,y=0},
        bottomleft = {x=0,y=window.height},
        bottomright = {x=window.width, y=window.height}, 
        center = window.width / 2,
        width = 4 }
paddle = { width = 10, height = 40, speed = 200 }
paddle1 = { x = 10, y = window.height / 2  - 20 }
paddle2 = { x = window.width - 20, y = window.height / 2 - 20 }
ball = { x = window.width / 2, y = window.height / 2, r = 5, speed = 100, angle = 0 }

function game.load()
    print("\ngame loaded")
    game.score = { 2, 0 }
end

function game.update(dt)
    if love.keyboard.isDown('up') and paddle1.y > board.width then
        paddle1.y = paddle1.y - (paddle.speed * dt)
    end
    if love.keyboard.isDown('down') and paddle1.y + paddle.height < window.height - board.width then
        paddle1.y = paddle1.y + (paddle.speed * dt)
    end
    if paddle1.y < board.width then paddle1.y = board.width end
    if paddle1.y + paddle.height > window.height - board.width then paddle1.y = window.height - paddle.height - board.width end
    
end

function game.draw()
    drawBoard()
    love.graphics.setColor(0, 132, 255, 255)
    love.graphics.rectangle("fill", paddle1.x, paddle1.y, paddle.width, paddle.height)
    love.graphics.setColor(224, 60, 40, 255)
    love.graphics.rectangle("fill", paddle2.x, paddle2.y, paddle.width, paddle.height)
    love.graphics.setColor(255, 231, 55, 255)
    love.graphics.circle("fill", ball.x, ball.y, ball.r)
end

function drawBoard()
    love.graphics.setColor(255, 233, 197, 255)
    love.graphics.rectangle("fill", board.topleft.x, board.topleft.y, board.topright.x, board.width)
    love.graphics.rectangle("fill", board.topleft.x, board.topleft.y, board.width, board.bottomleft.y)
    love.graphics.rectangle("fill", board.topright.x - board.width, board.topright.y, board.width, board.bottomleft.y)
    love.graphics.rectangle("fill", board.bottomleft.x, board.bottomleft.y - board.width, board.bottomright.x, board.width)
    for i = 7, window.height, window.height/7 do
        love.graphics.rectangle("fill", board.center-1, i, 2, 20)
    end
end

return game