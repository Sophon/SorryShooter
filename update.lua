
function Update(dt)
    player1:move(dt)
    player1:rotate()

    --collision
    for i, z in ipairs(zombies) do
        z:rotate(player1)
        z:move(dt)
        if distance(player1, z) <= hitbox then 
            killAllZombies()
        end
    end

    --shoot bullet
    for i, b in ipairs(bullets) do
        b:move(dt)
    end

    --bullet out of bounds
    for i = #bullets, 1, -1 do 
       local b = bullets[i]
       if b.pos.x < 0 or b.pos.y < 0 or b.pos.x > screenW or b.pos.y > screenH then
            table.remove(bullets, i)
       end
    end

    --bullet hits zombie
    for i, z in ipairs(zombies) do
        for j, b in ipairs(bullets) do
            if distance(b, z) <= hitbox then
                b.dead = true
                z.dead = true
            end
        end
    end

    --cleanup
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