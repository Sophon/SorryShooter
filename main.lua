
local Bullet = require("bullet")
local Player = require("player")
local Zombie = require("zombie")

hitbox = 20

love.window.setTitle("Shooter")

function love.load()
    sprites = {}
    sprites.background = love.graphics.newImage('sprites/background.png')

    player1 = Player
    player1:setPos(300, 300)
    
    zombies = {}
    bullets = {}
end

function love.update(dt)
    player1:move(dt)
    player1:rotate()

    for i, z in ipairs(zombies) do
        z:rotate(player1)
        z:move(dt)
        if distance(player1, z) < hitbox then 
            killAllZombies()
        end
    end

    for i, b in ipairs(bullets) do
        b:move(dt)
    end
end

function love.draw()
    love.graphics.draw(sprites.background, 0, 0)
    love.graphics.draw(player1.sprite, player1.position.x, player1.position.y, player1.angle, nil, nil, player1.sprite:getWidth()/2, player1.sprite:getHeight()/2)

    for i, z in ipairs(zombies) do
        love.graphics.draw(z.sprite, z.position.x, z.position.y, z.angle, nil, nil, z.sprite:getWidth()/2, z.sprite:getHeight()/2)
    end

    for i, b in ipairs(bullets) do
        love.graphics.draw(b.sprite, b.position.x, b.position.y, b.direction, 0.5, 0.5, b.sprite:getWidth()/2, b.sprite:getHeight()/2)
    end
end



function distance(player, enemy)
    return math.sqrt((player.position.x - enemy.position.x)^2 + (player.position.y - enemy.position.y)^2)
end


function love.keypressed(key)
    if key == "tab" then
        spawnZombie(zombies)
    end
    if key == "k" then
        spawnBullet(bullets, player1)
    end
end

function love.mousepressed(x, y, button,istouch)
    if button == 1 or button == 2 or button == 3 then
        spawnBullet(bullets, player1)
    end
end

function killAllZombies()
    for i, z in ipairs(zombies) do
        zombies[i] = nil
    end
end

