
local Bullet =  {}
bulletSprite = love.graphics.newImage('sprites/bullet.png')

function Bullet.create()
    local newBullet = {
        position = {},
        speed = 10,
        sprite = bulletSprite,
        direction = 0
    }
    return setmetatable(newBullet, {__index = Bullet})
end

function Bullet:setPos(x, y)
    self.position.x = x
    self.position.y = y
end

function Bullet:setDirection(angle)
    self.direction = angle
end

function Bullet:move(dt)
    local distance = self.speed * dt * 60  
    self.position.x = self.position.x + math.cos(self.direction) * distance
    self.position.y = self.position.y + math.sin(self.direction) * distance
end


function spawnBullet(bullets, player)
    local newBullet = Bullet.create()
    newBullet:setPos(player.position.x, player.position.y)
    newBullet.direction = player.angle

    table.insert(bullets, newBullet)
end
