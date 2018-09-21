
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
end

function love.draw()
    love.graphics.draw(sprites.background, 0, 0)
    love.graphics.draw(player1.sprite, player1.x, player1.y)
end

-- function move(object, direction, dt)
--     relativeSpeed = object.speed * dt * 60
--     if direction == 'l' then
--         object.x = object.x - relativeSpeed
--     end
--     if direction == 'r' then
--         object.x = object.x + relativeSpeed
--     end
--     if direction == 'u' then
--         object.y = object.y - relativeSpeed
--     end
--     if direction == 'd' then
--         object.y = object.y + relativeSpeed
--     end
-- end

-- function movePlayer(player, dt)
--     if love.keyboard.isDown('e') then
--         move(player, 'u', dt)
--     end
--     if love.keyboard.isDown('d') then
--         move(player, 'd', dt)
--     end
--     if love.keyboard.isDown('s') then
--         move(player, 'l', dt)
--     end
--     if love.keyboard.isDown('f') then
--         move(player, 'r', dt)
--     end
-- end