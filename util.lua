while true do
    redstone.setOutput("top", not redstone.getOutput("top"))
    print(not redstone.getOutput("top"))
    sleep(1)
end