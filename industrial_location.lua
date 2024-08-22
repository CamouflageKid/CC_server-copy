peripheral.find("modem", rednet.open)

rednet.host("industrial", "computer_inc")

local function output(dir)
    redstone.setOutput("left", false)
    redstone.setOutput("right", false)
    redstone.setOutput("front", false)
    redstone.setOutput("back", false)

    redstone.setOutput(dir, true)
end

local Player_List = {}
Range = 100
local pos1, pos2, pos3 = gps.locate()

local function compare_locations(p1,p2,p3)
    if p1 ~= nil and p2 ~= nil and p3 ~= nil and pos1 ~= nil and pos2 ~= nil and pos3 ~= nil then
        if p1 <= (pos1 + Range) and p1 >= (pos1 - Range) and p2 <= (pos2 + Range) and p2 >= (pos2 - Range) and p3 <= (pos3 + Range) and p3 >= (pos3 - Range) then
            print("Returned true,",p1,p2,p3)
            return true
        end
        print("Returned false,",p1,p2,p3)
        return false
    end
    print("Returned false,",p1,p2,p3)
    return false
end

local function check()
    if Player_List ~= {} then
        local is_player_in_area = false
        for i, v in pairs(Player_List) do
            local checked = compare_locations(v.p1, v.p2, v.p3)
            if checked then is_player_in_area = true end
        end
        Player_List = {}
        return is_player_in_area
    end
    return false
end

function Rednet_FAdmin()
    while true do
        id, data = rednet.receive("industrial_admin", 1)

        if data then
            Player_List[#Player_List + 1] = data
        end

        if check() then
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

    end
end

function clear_data()
    while true do
        sleep(1)
        Player_List = {}
    end
end

parallel.waitForAll(Rednet_FAdmin)