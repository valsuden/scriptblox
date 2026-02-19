local buttons = {
    {
        x = 90,
        y = 180,
        w = 220,
        h = 55,
        link = "https://link1.com",
        state = "idle",
        timer = 0
    },
    {
        x = 90,
        y = 260,
        w = 220,
        h = 55,
        link = "https://link2.com",
        state = "idle",
        timer = 0
    }
}

function love.load()
    love.window.setMode(400, 400)
    love.window.setTitle("NovaLink Hub")
end

function love.update(dt)
    for _, btn in ipairs(buttons) do
        if btn.state == "waiting" then
            btn.timer = btn.timer + dt
            if btn.timer >= 3 then
                love.system.setClipboardText(btn.link)
                btn.state = "copied"
            end
        end
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0.07, 0.07, 0.1)

    -- Título
    love.graphics.setColor(0, 0.8, 1)
    love.graphics.printf("NovaLink Hub", 0, 60, 400, "center")

    love.graphics.setColor(1,1,1)
    love.graphics.printf("Free servidores privados", 0, 90, 400, "center")

    love.graphics.setColor(0.6,0.6,0.6)
    love.graphics.printf("Created by Orion Devs", 0, 115, 400, "center")

    for i, btn in ipairs(buttons) do
        love.graphics.setColor(0, 0.6, 1)
        love.graphics.rectangle("fill", btn.x, btn.y, btn.w, btn.h, 14, 14)

        love.graphics.setColor(1,1,1)

        local text = "Get Link "..i

        if btn.state == "waiting" then
            text = "Copiando..."
        elseif btn.state == "copied" then
            text = "Copiado. Pega en el navegador"
        end

        love.graphics.printf(text, btn.x, btn.y + 18, btn.w, "center")
    end
end

-- PC Click
function love.mousepressed(x, y, button)
    if button == 1 then
        checkClick(x, y)
    end
end

-- Celular Touch
function love.touchpressed(id, x, y)
    x = x * 400
    y = y * 400
    checkClick(x, y)
end

function checkClick(x, y)
    for _, btn in ipairs(buttons) do
        if x > btn.x and x < btn.x + btn.w and
           y > btn.y and y < btn.y + btn.h then

            if btn.state == "idle" then
                btn.state = "waiting"
                btn.timer = 0
            end
        end
    end
end

