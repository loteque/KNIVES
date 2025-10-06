class_name inventory_smoke_test
extends Node

@export var inventory: Inventory

func _pr_inv(inv: Inventory):
	prints("inventory:", inv.items)
	for item in inv.items:
		prints(item.name)

func _ready() -> void:
	var item1 := InventoryItem.new(InventoryItem.T.SWORD, &"sword", "", "")
	item1.description = "a teeribel weapon to thrust upon thine enemies"
	item1.img_desc = "weapon"
	var item2 := InventoryItem.new(InventoryItem.T.SWORD, &"sword", "", "")
	item2.description = "a cracked sword. you should probably get a new one"
	item2.img_desc = "weapon"
	var item3 := InventoryItem.new(InventoryItem.T.KNIFE, &"knife", "", "")
	item3.description = "a good knife... for buttering toast"
	item3.img_desc = "weapon"
	var item4 := InventoryItem.new(InventoryItem.T.KNIFE, &"broken knife", "", "")
	item4.description = "now that's a knife! I toe knife!"
	item4.img_desc = "weapon"
	var item5 := InventoryItem.new(InventoryItem.T.SWORD, &"sword", "", "")
	item5.description = "a teeribel weapon to thrust upon thine enemies"
	item5.img_desc = "weapon"
	var item6 := InventoryItem.new(InventoryItem.T.SWORD, &"sword", "", "")
	item6.description = "a cracked sword. you should probably get a new one"
	item6.img_desc = "weapon"
	var item7 := InventoryItem.new(InventoryItem.T.KNIFE, &"knife", "", "")
	item7.description = "a good knife... for buttering toast"
	item7.img_desc = "weapon"
	var item8 := InventoryItem.new(InventoryItem.T.KNIFE, &"broken knife", "", "")
	item8.description = "now that's a knife! I toe knife!"
	item8.img_desc = "weapon"
	
	
	var pr = func(): return _pr_inv(inventory)
	pr.call()
	inventory.update(item1, 0)
	pr.call()
	inventory.update(item2, 1)
	pr.call()
	inventory.update(item3, 2)
	pr.call()
	inventory.update(item4, 3)
	pr.call()
	var i = 0
	for item in [item5, item6, item7, item8]:
		inventory.update(item, 4 + i)
		i+=1
	pr.call()
