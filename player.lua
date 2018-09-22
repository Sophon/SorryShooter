
local Player =  {
    position = {},
    speed = 3,
    angle = 0,
    sprite = love.graphics.newImage('sprites/player.png')
}

function Player.create()
    local newPlayer = {
        position = {},
        speed = 3,
        angle = 0,
        sprite = love.graphics.newImage('sprites/player.png')
    }
    return setmetatable(newPlayer, {_index = Player})
end

function Player:setPos(x, y)
    self.position.x = x
    self.position.y = y
end

function Player:move(dt)
    local distance = self.speed * dt * 60
    if love.keyboard.isDown('e') then
        self.position.y = self.position.y - distance
    end
    if love.keyboard.isDown('d') then
        self.position.y = self.position.y + distance
    end
    if love.keyboard.isDown('s') then
        self.position.x = self.position.x - distance
    end
    if love.keyboard.isDown('f') then
        self.position.x = self.position.x + distance
    end
end

function Player:rotate() 
    self.angle = math.atan2(love.mouse.getY() - self.position.y, love.mouse.getX() - self.position.x)
end

return Player