
local Zombie =  {
    position = {},
    speed = 6,
    angle = 0,
    sprite = love.graphics.newImage('sprites/zombie.png')
}

function Zombie.setPos(x, y)
    Zombie.position.x = x
    Zombie.position.y = y
end

function Zombie.move(dt)
   
end

function Zombie.rotate(dt, player) 
    Zombie.angle = math.atan2(player.position.y - Zombie.position.y, player.position.x - Zombie.position.x)
end

function spawnZombie(zombieTable)
    zombie = Zombie
    zombie.setPos(math.random(0, love.graphics.getWidth()), math.random(0, love.graphics.getHeight()))

    table.insert(zombieTable, zombie)
end

return Zombie