class_name Inventory
extends Node
enum EquipSlot {
	PRIMARY,
	SECONDARY
}
@export var max_size: int
signal is_full_changed(inventory: Inventory)
var is_full: bool = false:
	set(b):
		var prev_b = is_full
		if prev_b == b: return
		is_full = b
		is_full_changed.emit(self)
var items: Array[InventoryItem]:
	set(d):
		printerr("don't set value of Inventory items directly use .add() or .remove()")
	get:
		return _inventory_arr
var _inventory_arr: Array[InventoryItem]
var _primary: InventoryItem = InventoryItem.EMPTY
var _secondary: InventoryItem = InventoryItem.EMPTY
var _first_empty_idx: int


func update(inventory_item: InventoryItem, idx: int) -> void:
	_inventory_arr[idx] = inventory_item
	_first_empty_idx = _inventory_arr.find(InventoryItem.EMPTY)
	if _first_empty_idx == -1: is_full = true


func remove(idx: int) -> void:
	_inventory_arr[idx] = InventoryItem.EMPTY


func retrieve(idx: int) -> InventoryItem:
	var item = _inventory_arr[idx]
	remove(idx)
	return item


func equip(idx: int, equip_slot: EquipSlot) -> void:
	var item = retrieve(idx)
	match equip_slot:
		EquipSlot.PRIMARY:
			update(_primary, idx)
			_primary = item
		EquipSlot.SECONDARY:
			update(_secondary, idx)
			_secondary = item
		_:
			return


func _ready() -> void:
	for i in max_size:
		_inventory_arr.push_back(InventoryItem.EMPTY)
