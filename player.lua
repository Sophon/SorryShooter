
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

return Player