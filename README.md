# ComputerCraft タートル用プログラム

## 概要

MinecraftのMOD、ComputerCraftのタートルで使用するプログラムをまとめる  

## プログラム

### tunnel.lua

タートルの位置から前方に`<length>`ブロック、下方に1ブロック掘る  

	USEAGE: tunnel.lua <number length>

### floor.lua

タートルの位置から前方`<length>`ブロック、右方`<width>`ブロックの床を形成  
床形成には、インベントリ1から設置可能なブロックを順に使っていく

	USEAGE: floor.lua <number length> <number width>

### stair.lua

タートルの位置から前方`<length>`ブロック、下方／上方`<length>`ブロック、右方`<width>`ブロックの階段を形成  
引数`<direction>`に`up`を指定した場合には上り階段、`down`を指定した場合には下り階段を形成する  
階段形成には、インベントリ1から設置可能なブロックを順に使っていく

	USEAGE: stair.lua <string direction> <number length> <number width>  
	        direction must be "up" or "down"
