peripheral.find("modem", rednet.open)

local function output(dir)
    redstone.setOutput("left", false)
    redstone.setOutput("right", false)
    redstone.setOutput("front", false)
    redstone.setOutput("back", false)

    redstone.setOutput(dir, true)
end

Range = 100
local pos1, pos2, pos3 = gps.locate()

local function compare_locations(p1,p2,p3)
    if data.p1 ~= nil and data.p2 ~= nil and data.p3 ~= nil then
        if p1 <= (pos1 + Range) and p1 >= (pos1 - Range) and p2 <= (pos2 + Range) and p2 >= (pos2 - Range) and p3 <= (pos3 + Range) and p3 >= (pos3 - Range) then
            return true
        end
    end
    return false
end

function Rednet_FAdmin()
    while true do
        id, data = rednet.receive("industrial_admin", 1)

        if data then
            if compare_locations(data.p1, data.p2, data.p3) then
                Random_val = false
                redstone.setOutput("left", false)
                redstone.setOutput("right", false)
                redstone.setOutput("front", false)
                redstone.setOutput("back", false)
            else
                redstone.setOutput("left", true)
                redstone.setOutput("right", true)
                redstone.setOutput("front", true)
                redstone.setOutput("back", true)
            end
        else
            redstone.setOutput("left", true)
            redstone.setOutput("right", true)
            redstone.setOutput("front", true)
            redstone.setOutput("back", true)
        end
    end
end

parallel.waitForAll(Rednet_FAdmin)