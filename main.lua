--main.lua

a = require('Audio')
wf = require('libs/windfield/init')

require('constants')


function love.load()
    world   = wf.newWorld(500, 0)

    player  = world:newRectangleCollider(300, 300, pC.LW, pC.LW)


    ground1 = world:newRectangleCollider(400, 0, 10, 600)
    ground1:setType('static')
    ground2 = world:newRectangleCollider(0, 200, 600, 10)
    ground2:setType('static')
    ground3 = world:newRectangleCollider(0, 400, 600, 10)
    ground3:setType('static')
    ground4 = world:newRectangleCollider(-1, 0, 1, 600)
    ground4:setType('static')

    circle  = world:newCircleCollider(293, 300, 8)
    box     = world:newRectangleCollider(100, 300, 2, 2)

    joint = world:addJoint('RevoluteJoint', circle, player, 299, 308, false)
    

    a.load()

end

function love.update(dt)
    px, py = player:getLinearVelocity()
    if love.keyboard.isDown('a') and px > pC.maxVN then
        player:applyForce(0, 160)
    elseif love.keyboard.isDown('d') and px < pC.maxVP then
        player:applyForce(0, -160)
    end

    world:update(dt)

    a.update(dt)

end

function love.draw()
    world:draw()
end

function love.keypressed(key)
    if key == 'w' and pC.J > 0 then
        player:applyLinearImpulse(-200, 0)
    end
end
