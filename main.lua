
local Player = require("player")

function love.load()
    sprites = {}
    sprites.background = love.graphics.newImage('sprites/background.png')
    sprites.bullet = love.graphics.newImage('sprites/bullet.png')
    sprites.zombie = love.graphics.newImage('sprites/zombie.png')

    player1 = Player
    player1.setPos(300, 300)
end

function love.update()
    movePlayer(player1)
end

function love.draw()
    love.graphics.draw(sprites.background, 0, 0)
    love.graphics.draw(player1.sprite, player1.x, player1.y)
end

function move(object, direction)
    if direction == 'l' then
        object.x = object.x - object.speed
    end
    if direction == 'r' then
        object.x = object.x + object.speed
    end
    if direction == 'u' then
        object.y = object.y - object.speed
    end
    if direction == 'd' then
        object.y = object.y + object.speed
    end
end

function movePlayer(player)
    if love.keyboard.isDown('e') then
        move(player, 'u')
    end
    if love.keyboard.isDown('d') then
        move(player, 'd')
    end
    if love.keyboard.isDown('s') then
        move(player, 'l')
    end
    if love.keyboard.isDown('f') then
        move(player, 'r')
    end
end