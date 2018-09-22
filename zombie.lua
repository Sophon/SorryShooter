
local Zombie =  {}
Zombie.sprite = love.graphics.newImage('sprites/zombie.png')

-- RETURNS a freshly created Zombie instance
function Zombie.create()
    local newZombie = {
        position = {},
        speed = 1,
        angle = 0,
        sprite = love.graphics.newImage('sprites/zombie.png')
    }
    return setmetatable(newZombie, {__index = Zombie})
end

function Zombie:setPos(x, y)
    self.position.x = x
    self.position.y = y
end

function Zombie:move(dt)
    local distance = self.speed * dt * 60  
    self.position.x = self.position.x + math.cos(self.angle) * distance
    self.position.y = self.position.y + math.sin(self.angle) * distance
end

function Zombie:rotate(player) 
    self.angle = math.atan2(player.position.y - self.position.y, player.position.x - self.position.x)
end

function spawnZombie(zombies)
    local newZombie = Zombie.create()
    newZombie:setPos(math.random(0, love.graphics.getWidth()), math.random(0, love.graphics.getHeight()))

    table.insert(zombies, newZombie)
end
