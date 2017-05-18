# ComputerCraft タートル用プログラム

## 概要

MinecraftのMOD、ComputerCraftのタートルで使用するプログラムをまとめる  

## プログラム

### tunnel.lua

タートルの位置から前方に`<length>`ブロック、下方に1ブロック掘る  

	USEAGE: tunnel.lua <number length>

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
