while true do
    redstone.setOutput("top", not redstone.getOutput("top"))
    sleep(100)
end