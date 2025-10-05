class_name InventoryItem
extends Resource

enum T {
	INVALID = 0,
	SWORD = 1000,
	KNIFE = 2000,
	HELM = 3000,
	FOOD = 4000,
}
var type: T
var name: StringName 

func _init(i_type: T, i_name: StringName) -> void:
	type = i_type
	name = i_name
