local function output(dir)
    redstone.setOutput("left", false)
    redstone.setOutput("right", false)
    redstone.setOutput("front", false)
    redstone.setOutput("back", false)

    redstone.setOutput(dir, true)
end

Range = 10
local pos1, pos2, pos3 = gps.locate()

local function compare_locations(p1,p2,p3)
    if p1 <= (pos1 + Range) and p1 >= (pos1 - Range) then
        return true
    end
    if p2 <= (pos2 + Range) and p2 >= (pos2 - Range) then
        return true
    end
    if p3 <= (pos3 + Range) and p3 >= (pos3 - Range) then
        return true
    end
    return false
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

    
    sleep(10)
end