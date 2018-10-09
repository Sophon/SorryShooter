
local Zombie =  {}
zombieSprite = love.graphics.newImage('sprites/zombie.png')

function Zombie.create()
    local newZombie = {
        pos = {},
        speed = 1.2,
        angle = 0,
        sprite = zombieSprite,
        dead = false
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
    if table.getn(zombies) <= maxZombies then
        local coordinate = {x = 0, y = 0}
        local side  = math.random(1,4)
        if side == 1 then --top
            coordinate.x = math.random(0, screenW)
            coordinate.y = -30
        elseif side == 2 then --right
            coordinate.x = screenW + 30
            coordinate.y = math.random(0, screenH)
        elseif side == 3 then --bot
            coordinate.x = math.random(0, screenW)
            coordinate.y = screenH + 30
        else --left
            coordinate.x = -30
            coordinate.y = math.random(0, screenH)
        end

        local newZombie = Zombie.create()
        newZombie:setPos(coordinate.x, coordinate.y)

        table.insert(zombies, newZombie)
    end
end

return Zombie
