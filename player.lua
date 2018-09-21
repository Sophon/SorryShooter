
local Player =  {
    x = 0,
    y = 0,
    speed = 3,
    sprite = love.graphics.newImage('sprites/player.png')
}

function Player.setPos(x, y)
    Player.x = x
    Player.y = y
end

function Player.move(dt)
    distance = Player.speed * dt * 60
    if love.keyboard.isDown('e') then
        Player.y = Player.y - distance
    end
    if love.keyboard.isDown('d') then
        Player.y = Player.y + distance
    end
    if love.keyboard.isDown('s') then
        Player.x = Player.x - distance
    end
    if love.keyboard.isDown('f') then
        Player.x = Player.x + distance
    end
end

return Player