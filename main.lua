
local Player = require("player")

love.window.setTitle("SorryShooter")

function love.load()
    sprites = {}
    sprites.background = love.graphics.newImage('sprites/background.png')
    sprites.bullet = love.graphics.newImage('sprites/bullet.png')
    sprites.zombie = love.graphics.newImage('sprites/zombie.png')

    player1 = Player
    player1.setPos(300, 300)
end

function love.update(dt)
    player1.move(dt)
    player1.rotate(dt)
end

function love.draw()
    love.graphics.draw(sprites.background, 0, 0)
    love.graphics.draw(player1.sprite, player1.position.x, player1.position.y, player1.angle, nil, nil, player1.sprite:getWidth()/2, player1.sprite:getHeight()/2)
end
