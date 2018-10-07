
local Bullet = require "units.bullet"
local Player = require "units.player"
local Zombie = require "units.zombie"

function Load() 
    sprites = {}
    sprites.background = love.graphics.newImage('sprites/background.png')

    player1 = Player
    player1:setPos(300, 300)
    
    zombies = {}
    bullets = {}
end