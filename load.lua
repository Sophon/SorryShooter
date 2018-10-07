
local Bullet = require "units.bullet"
local Player = require "units.player"
local Zombie = require "units.zombie"

function Load() 
    gameState = 0

    maxTime = defaultMaxTime
    timer = maxTime

    sprites = {}
    sprites.background = love.graphics.newImage('sprites/background.png')

    player1 = Player
    player1:setPos()
    
    zombies = {}
    bullets = {}
end