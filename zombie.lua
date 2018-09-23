
local Zombie =  {}
zombieSprite = love.graphics.newImage('sprites/zombie.png')

function Zombie.create()
    local newZombie = {
        pos = {},
        speed = 1,
        angle = 0,
        sprite = zombieSprite
    }
    return setmetatable(newZombie, {__index = Zombie})
end

function Zombie:setPos(x, y)
    self.pos.x = x
    self.pos.y = y
end

function Zombie:move(dt)
    local distance = self.speed * dt * 60  
    self.pos.x = self.pos.x + math.cos(self.angle) * distance
    self.pos.y = self.pos.y + math.sin(self.angle) * distance
end

function Zombie:rotate(player) 
    self.angle = math.atan2(player.pos.y - self.pos.y, player.pos.x - self.pos.x)
end

function spawnZombie(zombies)
    local newZombie = Zombie.create()
    newZombie:setPos(math.random(0, love.graphics.getWidth()), math.random(0, love.graphics.getHeight()))

    table.insert(zombies, newZombie)
end
