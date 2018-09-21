
local Player = require("player")
local Zombie = require("zombie")

love.window.setTitle("SorryShooter")

function love.load()
    sprites = {}
    sprites.background = love.graphics.newImage('sprites/background.png')
    sprites.bullet = love.graphics.newImage('sprites/bullet.png')

    player1 = Player
    player1.setPos(300, 300)

    zombies = {}
end

function love.update(dt)
    player1.move(dt)
    player1.rotate(dt)
    for i,z in ipairs(zombies) do
        z.rotate(dt, player1)
    end
end

function love.draw()
    love.graphics.draw(sprites.background, 0, 0)
    love.graphics.draw(player1.sprite, player1.position.x, player1.position.y, player1.angle, nil, nil, player1.sprite:getWidth()/2, player1.sprite:getHeight()/2)

    for i,z in ipairs(zombies) do
        love.graphics.draw(z.sprite, z.position.x, z.position.y, z.angle, nil, nil, z.sprite:getWidth()/2, z.sprite:getHeight()/2)
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "u" then
        spawnZombie(zombies)
    end
end

