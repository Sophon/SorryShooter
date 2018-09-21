
local Player =  {
    x = 0,
    y = 0,
    speed = 1,
    sprite = love.graphics.newImage('sprites/player.png')
}

function Player.setPos(x, y)
    Player.x = x
    Player.y = y
end

function Player.moveUp()
    Player.y = Player.y - 1
end
function Player.moveDown()
    Player.y = Player.y + 1
end
function Player.moveLeft()
    Player.x = Player.x - 1
end

return Player