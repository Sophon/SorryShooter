
local Bullet = require "units.bullet"
local Player = require "units.player"
local Zombie = require "units.zombie"

function Load()
    bgm = love.audio.newSource("sounds/theme.mp3", "static")
    bgm:play()
    bgm:setVolume(0.3)

    gameState = 0

    maxTime = defaultMaxTime
    timer = maxTime

    sprites = {}
    sprites.background = love.graphics.newImage('sprites/background.png')

    player1 = Player
    player1:setPos()

    score = 0
    
    zombies = {}
    bullets = {}
end