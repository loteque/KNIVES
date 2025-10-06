extends VBoxContainer

signal is_clear_changed(slot: VBoxContainer)
var index: int
var item: InventoryItem:
	set(ii):
		item = ii
		get_node("Label").text = item.name
		get_node("Button").text = item.img_desc
		get_node("RichTextLabel").text = item.description
var is_clear: bool:
	set(b):
		var prev_b = is_clear
		if prev_b == b: return
		is_clear = b
		is_clear_changed.emit(self)


func update(new_item: InventoryItem, new_item_index: int = self.index):
	index = new_item_index
	item = new_item
	if item.type == InventoryItem.T.EMPTY:
		is_clear = true
		return
	is_clear = false
