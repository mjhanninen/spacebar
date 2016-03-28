function love.load()
    aika_laskuri = nil
    odota_nostoa = false
    peli_on_loppu = false
    spacebar_laskuri = 2 + 3 * love.math.random()
    spacebar_on_lauennut = false
end

function love.update(dt)
    if not peli_on_loppu then
        if not spacebar_on_lauennut then
            spacebar_laskuri = spacebar_laskuri - dt
            if spacebar_laskuri < 0 then
                spacebar_on_lauennut = true
                aika_laskuri = 0.4
            end
        else
            aika_laskuri = aika_laskuri - dt
            if aika_laskuri < 0 then
                peli_on_loppu = true
                odota_nostoa = false
            end
        end
    end
end

function love.draw(dt)
    love.graphics.clear(25, 75, 230)
    love.graphics.setColor(255, 115, 25)
    if peli_on_loppu then
        love.graphics.print("HÄVISIT!", 300, 275, 0, 4)
        love.graphics.print("Lopeta painamalla ESC-näppäintä", 295, 350)
    elseif spacebar_on_lauennut then
        love.graphics.rectangle("fill", 200, 250, 400, 100)
    else
        -- Odotellessa ei näytetä mitään
    end
end

function love.keypressed(nappain, scan_koodi, on_toisto)
    if nappain == "escape" then
        love.event.quit()
    elseif not peli_on_loppu then
        if nappain == "space" then
            if spacebar_on_lauennut then
                odota_nostoa = true
            else
                peli_on_loppu = true
            end
        end
    end
end

function love.keyreleased(nappain, scan_koodi, on_toisto)
    if nappain == "space" and odota_nostoa then
        odota_nostoa = false
        spacebar_on_lauennut = false
        spacebar_laskuri = 2 + 3 * love.math.random()
    end
end
