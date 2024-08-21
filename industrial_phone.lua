peripheral.find("modem", rednet.open)

while true do
    list = {}
    list.p1, list.p2, list.p3 = gps.locate()
    rednet.broadcast(list, "industrial_admin")
end
