os.loadAPI("rom/myTurtle/API/turtleEx")

--------------------------------------------------
-- 引数取り込み＆型チェック
--------------------------------------------------
local Args = {...}

if (table.maxn(Args) ~= 3) then
	print("USEAGE:\nstair.lua <string direction> <number length> <number width>")
	return
end

local direction = Args[1]
local length = tonumber(Args[2])
local width = tonumber(Args[3])

if not ((direction == "up") or (direction == "down")) then
	print("1st arg must be a string, \"up\" or \"down\".")
	return
elseif type(length) ~= "number" then
	print("2nd arg must be a number.")
	return
elseif type(width) ~= "number" then
	print("3rd arg must be a number.")
	return
end

--------------------------------------------------
-- 必要燃料量計算＆燃料補給成否チェック
--------------------------------------------------
local fuelLevel
fuelLevel = width * length + length -- 行きの燃料
fuelLevel = fuelLevel + length * 2  -- 偶数段のときの帰りの燃料
if length % 2 == 1 then
	fuelLevel = fuelLevel + (width - 1) -- 奇数段のときの帰りの燃料
end

if fuelLevel > turtleEx.refuel(fuelLevel) then
	print("FuelLevel is too short.")
	return
end

--------------------------------------------------
-- 階段形成
--------------------------------------------------
if not turtle.forward() then
	return false
end

turtle.turnRight()

if (direction == "up") and (not turtle.up()) then
	return false
elseif (direction == "down") and (not turtle.down()) then
	return false
end

for i = 1, length do
	for j = 1, width do
		while not (turtle.detectDown() or turtle.placeDown()) do
			if turtle.getSelectedSlot() == 16 then
				print("Item empty.")
				return false
			end
			turtle.select(turtle.getSelectedSlot() + 1)
		end
		
		if j ~= width then
			if not turtle.forward() then
				return false
			end
		elseif i ~= length then
			if i % 2 == 0 then
				turtleEx.uTurn("right")
			else
				turtleEx.uTurn("left")
			end
			if (direction == "up") and (not turtle.up()) then
				return false
			elseif (direction == "down") and (not turtle.down()) then
				return false
			end
		end
	end
end

--------------------------------------------------
-- 初期位置に戻る
--------------------------------------------------
if length % 2 == 0 then
	turtle.turnRight()
else
	for i = 1, (width - 1) do
		turtle.back()
	end
	turtle.turnLeft()
end

for i = 1, length do
	if direction == "up" then
		turtle.back()
	end
	if (direction == "up") and (not turtle.down()) then
		return false
	elseif (direction == "down") and (not turtle.up()) then
		return false
	end
	if direction == "down" then
		turtle.back()
	end
end
