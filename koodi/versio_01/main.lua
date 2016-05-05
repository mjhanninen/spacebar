function love.load()
    love.window.setMode(640, 480)
end

function love.update(dt)
    -- Kirjoita tähän myöhemmin pelin tilaa päivittävä koodi
end

function love.draw()
    love.graphics.clear(25, 75, 230)
    love.graphics.setColor(255, 115, 25)
    love.graphics.rectangle("fill", 120, 190, 400, 100)
end

function love.keypressed(nappain)
    if nappain == "escape" then
        love.event.quit()
    end
end