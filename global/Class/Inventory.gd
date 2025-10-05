class_name Inventory
extends Node
@export var max_size: int
var items: Dictionary[int, InventoryItem]:
	set(d):
		printerr("don't set value of Inventory items directly use .add() or .remove()")
	get:
		return _inventory
var _inventory: Dictionary[int, InventoryItem]
var _inventory_arr: Array[Dictionary]


func _update_inventory_arr() -> Array:
	var arr: Array[Dictionary]
	var inventory_keys := _inventory.keys()
	for key in inventory_keys:
		var dict := {
			key: _inventory[key]
		}
		arr.push_back(dict)
	return arr


func _get_value_from_item_dict(item_dict: Dictionary):
	if item_dict.size() > 1: return false
	for key in item_dict.keys(): 
		return item_dict[key]


func _rebuild_dictionary() -> Dictionary[int, InventoryItem]:
	var new_dict: Dictionary[int, InventoryItem] = {}
	var count := 0
	for item_dict in _inventory_arr:
		#prints("arr[dict] iterator, item_dict:", item_dict)
		var inventory_item = _get_value_from_item_dict(item_dict)
		#prints("inventory_item", inventory_item)
		var new_key = inventory_item.type + count
		#prints("new_key", new_key)
		var new_item_dict = {
			new_key: inventory_item
		}
		#prints("new_item_dict", new_item_dict)
		new_dict.merge(new_item_dict)
		count += 1
	#prints("new_dict", new_dict)
	return new_dict


func add(inventory_item: InventoryItem) -> bool:
	if items.size() == max_size:
		push_warning("inventory full")
		return false
	var item_type_int = inventory_item.type
	var inventory_id : int = item_type_int + _inventory_arr.size() + 1
	#prints("inventory_id:", inventory_id)
	#prints("inventory_item:", inventory_item)
	var item_dict := {
		inventory_id: inventory_item
	}
	prints(item_dict)
	_inventory_arr.push_back(item_dict)
	_inventory = _rebuild_dictionary()
	#prints(_inventory)
	return true


func remove(item_id: int) -> void:
	_inventory.erase(item_id)
	_inventory_arr = _update_inventory_arr()
	_inventory = _rebuild_dictionary()


func retrieve(item_id: int) -> InventoryItem:
	var inventory_item: InventoryItem = _inventory[item_id]
	remove(item_id)
	return inventory_item
