
local Bullet = require("bullet")
local Player = require("player")
local Zombie = require("zombie")

function Load() 
    sprites = {}
    sprites.background = love.graphics.newImage('sprites/background.png')

    player1 = Player
    player1:setPos(300, 300)
    
    zombies = {}
    bullets = {}
end