
local Bullet = require("bullet")
local Player = require("player")
local Zombie = require("zombie")

hitbox = 20
screenW = love.graphics.getWidth()
screenH = love.graphics.getHeight()

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
        if distance(player1, z) <= hitbox then 
            killAllZombies()
        end
    end

    for i, b in ipairs(bullets) do
        b:move(dt)
    end

    for i = #bullets, 1, -1 do 
       local b = bullets[i]
       if b.pos.x < 0 or b.pos.y < 0 or b.pos.x > screenW or b.pos.y > screenH then
            table.remove(bullets, i)
       end
    end

    for i, z in ipairs(zombies) do
        for j, b in ipairs(bullets) do
            if distance(b, z) <= hitbox then
                b.dead = true
                z.dead = true
            end
        end
    end

    for i = #bullets, 1, -1 do
        local b = bullets[i]
        if b.dead == true then
            table.remove(bullets, i)
        end
    end
    for i = #zombies, 1, -1 do
        local z = zombies[i]
        if z.dead == true then
            table.remove(zombies, i)
        end
    end
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

