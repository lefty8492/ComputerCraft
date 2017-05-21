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

