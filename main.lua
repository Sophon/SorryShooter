
local Bullet = require("bullet")
local Player = require("player")
local Zombie = require("zombie")

require("load")
require("update")

hitbox = 20
screenW = love.graphics.getWidth()
screenH = love.graphics.getHeight()

love.window.setTitle("Shooter")

function love.load()
    Load()
end

function love.update(dt)
    Update(dt)
end

function love.draw()
    love.graphics.draw(sprites.background, 0, 0)

    local major, minor, revision, codename = love.getVersion()
    local str = string.format("Version %d.%d.%d - %s", major, minor, revision, codename)
    love.graphics.print(str, 20, 20)
    
    love.graphics.draw(player1.sprite, player1.pos.x, player1.pos.y, player1.angle, nil, nil, player1.sprite:getWidth()/2, player1.sprite:getHeight()/2)

    for i, z in ipairs(zombies) do
        love.graphics.draw(z.sprite, z.pos.x, z.pos.y, z.angle, nil, nil, z.sprite:getWidth()/2, z.sprite:getHeight()/2)
    end

    for i, b in ipairs(bullets) do
        love.graphics.draw(b.sprite, b.pos.x, b.pos.y, b.direction, 0.5, 0.5, b.sprite:getWidth()/2, b.sprite:getHeight()/2)
    end
end



function distance(a, b)
    return math.sqrt((a.pos.x - b.pos.x)^2 + (a.pos.y - b.pos.y)^2)
end


function love.keypressed(key)
    if key == "space" then
        spawnZombie(zombies)
    end
end

function love.mousepressed(x, y, button,istouch)
    if button == 1 then
        spawnBullet(bullets, player1)
    end
end

function killAllZombies()
    for i, z in ipairs(zombies) do
        zombies[i] = nil
    end
end

