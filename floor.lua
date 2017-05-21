os.loadAPI("rom/myTurtle/API/turtleEx")

--------------------------------------------------
-- 引数取り込み＆型チェック
--------------------------------------------------
local Args = {...}

if (table.maxn(Args) ~= 2) then
	print("USEAGE:\nfloor.lua <number length> <number width>")
	return
end

local length = tonumber(Args[1])
local width = tonumber(Args[2])

if type(length) ~= "number" then
	print("1st arg must be a number.")
	return
elseif type(width) ~= "number" then
	print("2nd arg must be a number.")
	return
end

--------------------------------------------------
-- 必要燃料量計算＆燃料補給成否チェック
--------------------------------------------------
local fuelLevel
if width % 2 == 0 then
	fuelLevel = length * width + (width - 1) + 1
else
	fuelLevel = length * width + (length - 1) + (width - 1) + 1
end

if fuelLevel > turtleEx.refuel(fuelLevel) then
	print("FuelLevel is too short.")
	return
end

--------------------------------------------------
-- 床形成
--------------------------------------------------
if not turtle.forward() then
	return false
end

turtle.select(1)

for i = 1, width do
	for j = 1, length do
		while not (turtle.detectDown() or turtle.placeDown()) do
			if turtle.getSelectedSlot() == 16 then
				print("Item empty.")
				return false
			end
			turtle.select(turtle.getSelectedSlot() + 1)
		end
		
		if j ~= length then
			if not turtle.forward() then
				return false
			end
		elseif i ~= width then
			if i % 2 == 0 then
				turtleEx.uTurn("left")
			else
				turtleEx.uTurn("right")
			end
		end
	end
end

--------------------------------------------------
-- 初期位置に戻る
--------------------------------------------------
if width % 2 == 0 then
	turtle.turnRight()
else
	for i = 1, (length - 1) do
		turtle.back()
	end
	turtle.turnLeft()
end

for i = 1, (width - 1) do
	turtle.forward()
end
turtle.turnRight()
turtle.back()

