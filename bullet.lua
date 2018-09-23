
local Bullet =  {}
bulletSprite = love.graphics.newImage('sprites/bullet.png')

function Bullet.create()
    local newBullet = {
        pos = {},
        speed = 10,
        sprite = bulletSprite,
        direction = 0
    }
    return setmetatable(newBullet, {__index = Bullet})
end

function Bullet:setPos(x, y)
    self.pos.x = x
    self.pos.y = y
end

function Bullet:setDirection(angle)
    self.direction = angle
end

function Bullet:move(dt)
    local distance = self.speed * dt * 60  
    self.pos.x = self.pos.x + math.cos(self.direction) * distance
    self.pos.y = self.pos.y + math.sin(self.direction) * distance
end


function spawnBullet(bullets, player)
    local newBullet = Bullet.create()
    newBullet:setPos(player.pos.x, player.pos.y)
    newBullet.direction = player.angle

    table.insert(bullets, newBullet)
end
