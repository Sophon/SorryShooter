
local Bullet = require "units.bullet"
local Player = require "units.player"
local Zombie = require "units.zombie"

function Load() 
    gameState = 1

    maxTime = 2
    timer = maxTime

    sprites = {}
    sprites.background = love.graphics.newImage('sprites/background.png')

    player1 = Player
    player1:setPos(300, 300)
    
    zombies = {}
    bullets = {}
end