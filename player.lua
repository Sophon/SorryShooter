
local Player =  {
    position = {},
    speed = 3,
    angle = 0,
    sprite = love.graphics.newImage('sprites/player.png')
}

function Player.setPos(x, y)
    Player.position.x = x
    Player.position.y = y
end

function Player.move(dt)
    distance = Player.speed * dt * 60
    if love.keyboard.isDown('e') then
        Player.position.y = Player.position.y - distance
    end
    if love.keyboard.isDown('d') then
        Player.position.y = Player.position.y + distance
    end
    if love.keyboard.isDown('s') then
        Player.position.x = Player.position.x - distance
    end
    if love.keyboard.isDown('f') then
        Player.position.x = Player.position.x + distance
    end
end

function Player.rotate(dt) 
    Player.angle = math.atan2(love.mouse.getY() - Player.position.y, love.mouse.getX() - Player.position.x)
end

return Player