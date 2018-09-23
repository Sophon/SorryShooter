
local Player =  {
    pos = {},
    speed = 3,
    angle = 0,
    sprite = love.graphics.newImage('sprites/player.png')
}

function Player.create()
    local newPlayer = {
        pos = {},
        speed = 3,
        angle = 0,
        sprite = love.graphics.newImage('sprites/player.png')
    }
    return setmetatable(newPlayer, {_index = Player})
end

function Player:setPos(x, y)
    self.pos.x = x
    self.pos.y = y
end

function Player:move(dt)
    local distance = self.speed * dt * 60
    if love.keyboard.isDown('e') then
        self.pos.y = self.pos.y - distance
    end
    if love.keyboard.isDown('d') then
        self.pos.y = self.pos.y + distance
    end
    if love.keyboard.isDown('s') then
        self.pos.x = self.pos.x - distance
    end
    if love.keyboard.isDown('f') then
        self.pos.x = self.pos.x + distance
    end
end

function Player:rotate() 
    self.angle = math.atan2(love.mouse.getY() - self.pos.y, love.mouse.getX() - self.pos.x)
end

return Player