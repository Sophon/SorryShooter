
function Draw()
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