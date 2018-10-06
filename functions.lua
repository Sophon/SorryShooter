
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