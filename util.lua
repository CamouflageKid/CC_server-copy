local function output(dir)
    redstone.setOutput("left", false)
    redstone.setOutput("right", false)
    redstone.setOutput("front", false)
    redstone.setOutput("back", false)

    redstone.setOutput(dir, true)
end


while true do

    local val = math.random(0, 4)


    if val < 1 then
        output("right")
    elseif val >= 1 and val < 2 then
        output("left")
    elseif val >= 2 and val < 3 then
        output("front")
    elseif val >= 3 and val <= 4 then
        output("back")
    end

    
    sleep(0.05)
end