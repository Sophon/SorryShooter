

screenW = love.graphics.getWidth()
screenH = love.graphics.getHeight()

function distance(a, b)
    return math.sqrt((a.pos.x - b.pos.x)^2 + (a.pos.y - b.pos.y)^2)
end

function spawnZombies(dt)
    if gameState == 1 then
        timer = timer - dt
        if timer <= 0 then
            spawnZombie(zombies)
            maxTime = maxTime * timeDecrRatio
            timer = maxTime
        end
    end
end

function resetGame()
    maxTime = defaultMaxTime
    timer = maxTime

    killAllZombies()

    gameState = 0
end

function love.mousepressed(x, y, button,istouch)
    if button == 1 and gameState == 1 then
        spawnBullet(bullets, player1)
    end

    if gameState ~= 1 then
        gameState = 1
        player1:setPos()
    end
end

function killAllZombies()
    for i, z in ipairs(zombies) do
        zombies[i] = nil
    end
end