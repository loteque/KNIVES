class_name InventoryItem
extends Resource

enum T {
	EMPTY = 0,
	SWORD = 1000,
	KNIFE = 2000,
	HELM = 3000,
	FOOD = 4000,
}
var type: T
var name: StringName
var item_res: ItemResource
var description: String
var img: Sprite2D
var img_desc: String

func _init(i_type: T, i_name: StringName, i_img_desc: String, i_desc: String) -> void:
	type = i_type
	name = i_name
	img_desc = i_img_desc
	description = i_desc


static var EMPTY = InventoryItem.new(
	T.EMPTY, 
	"",
	"empty",
	"" 
)
