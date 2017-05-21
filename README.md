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

## API

### turtleEx

#### turtleEx.searchItem

タートルのインベントリから特定のアイテムを検索する  
アイテム名は必須、ダメージ値はオプション  

	USEAGE: turtleEx.searchItem(string itemName, [number damage])  
	RETURN: boolean item.found 目的のアイテムが見つかった時true  
	        number  item.slot  目的のアイテムが格納されたスロット  
	        number  item.count 目的のアイテムの個数  
  
#### turtleEx.refuel

タートルのインベントリから石炭または木炭を検索し、  
指定した燃料レベルになるまで燃料補給を行う  
現在の燃料レベルが指定した燃料レベルよりも多い時には補給しない  
指定した燃料レベルに石炭または木炭が不足している場合は、あるだけ補給する  

	USEAGE: turtleEx.refuel(number fuelLevel)  
	RETURN: number 燃料補給後の燃料レべル  

#### turtleEx.uTurn

タートルを`direction`で指定した側の隣レーンに移動させる  

	USEAGE: turtleEx.uTurn(string direction)  
	RETURN: boolean 移動完了したとき true、移動できなかったとき false  
