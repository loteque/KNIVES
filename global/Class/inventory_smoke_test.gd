class_name inventory_smoke_test
extends Node

@export var inventory: Inventory

func _pr_inv(inv: Inventory):
	prints("inventory:", inv.items)
	for key in inv.items:
		prints(inv.items[key].name)

func _ready() -> void:
	inventory.max_size = 3
	
	var item1 := InventoryItem.new(InventoryItem.T.SWORD, &"sword")
	var item2 := InventoryItem.new(InventoryItem.T.SWORD, &"sword")
	var item3 := InventoryItem.new(InventoryItem.T.KNIFE, &"knife")
	var item4 := InventoryItem.new(InventoryItem.T.KNIFE, &"broken knife")
	
	var pr = func(): return _pr_inv(inventory)
	pr.call()
	inventory.add(item1)
	pr.call()
	inventory.add(item2)
	pr.call()
	inventory.add(item3)
	pr.call()
	inventory.add(item4)
	pr.call()
	prints("retrieve:", inventory.retrieve(2002).name)
	pr.call()
	inventory.add(item4)
	pr.call()
	
