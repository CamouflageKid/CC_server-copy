while true do
    redstone.setOutput("top", not redstone.getOutput("top"))
    print(redstone.getOutput("top"))
    sleep(0.5)
end