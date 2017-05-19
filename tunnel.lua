os.loadAPI("rom/myTurtle/API/turtleEx")

local Args = {...}
local length = Args[1]

local torch = turtleEx.searchItem("minecraft:torch")
if not torch.found then
	print("Torch is not found.")
	return
elseif torch.count < (length / 4) then
	print("Number of torch is small.")
	return
elseif turtleEx.refuel(length * 2) < (length * 2) then
	print("FuelLevel is too short.")
	return
end

for i = 1, length do
	while turtle.detect() do
		turtle.dig()
	end
	turtle.forward()
	turtle.digDown()
	if (i % 4) == 0 then
		turtle.select(torch.slot)
		turtle.placeDown(1)
	end
end

for i = 1, length do
	turtle.back()
end

