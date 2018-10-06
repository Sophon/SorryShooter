
local Bullet = require("bullet")
local Player = require("player")
local Zombie = require("zombie")

require("load")
require("update")
require("draw")
require("functions")

hitbox = 20
screenW = love.graphics.getWidth()
screenH = love.graphics.getHeight()

love.window.setTitle("Shooter")

function love.load()
    Load()
end

function love.update(dt)
    Update(dt)
end

function love.draw()
    Draw()
end





