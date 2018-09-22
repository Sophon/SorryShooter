
local Player = require("player")
local Zombie = require("zombie")

love.window.setTitle("Shooter")

function love.load()
    sprites = {}
    sprites.background = love.graphics.newImage('sprites/background.png')

    player1 = Player
    player1:setPos(300,300)

    zombies = {}
end

function love.update(dt)
    player1:move(dt)
    player1:rotate()

    for i, z in ipairs(zombies) do
        z:rotate(player1)
        z:move(dt)
    end
end

function love.draw()
    love.graphics.draw(sprites.background, 0, 0)
    love.graphics.draw(player1.sprite, player1.position.x, player1.position.y, player1.angle, nil, nil, player1.sprite:getWidth()/2, player1.sprite:getHeight()/2)

    for i,z in ipairs(zombies) do
        love.graphics.draw(z.sprite, z.position.x, z.position.y, z.angle, nil, nil, z.sprite:getWidth()/2, z.sprite:getHeight()/2)
        love.graphics.printf("order" ..i, 0, 50, love.graphics.getWidth(), "center")
    end
end

function distance(player, enemy)
    return math.sqrt((player.position.x - enemy.position.x)^2 + (player.position.y - enemy.position.y)^2)
end

function love.keypressed(key, scancode, isrepeat)
    if key == "u" then
        spawnZombie(zombies)
    end
end

