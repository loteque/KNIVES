extends Control

@export var inventory: Inventory
@export var primary_slot: VBoxContainer
@export var secondary_slot: VBoxContainer
@onready var hbox = %HBox
@onready var inv_slot: PackedScene = load("res://ui/inventory/inventory_slot.tscn")
var prev_selected_slot: VBoxContainer
var selected_slot: VBoxContainer
var max_slots: int
var pickup: InventoryItem

func _setup_btn_focus():
	var f_btn := hbox.get_child(0).get_node("Button") as Button
	var l_btn := hbox.get_child(inventory.items.size() - 1).get_node("Button") as Button
	f_btn.focus_neighbor_left = l_btn.get_path()
	l_btn.focus_neighbor_right = f_btn.get_path()
	if not prev_selected_slot:
		f_btn.grab_focus()
		return
	prev_selected_slot.get_node("Button").grab_focus()


func _ready() -> void:
	get_viewport().gui_focus_changed.connect(_on_focus_changed)
	for i in max_slots:
		var slot = inv_slot.instantiate()
		slot.index = i
		slot.item = inventory.items[i].gui_focus_changed.connect(_on_focus_changed)
	max_slots = inventory.max_size
	for i in max_slots:
		var slot = inv_slot.instantiate()
		slot.index = i
		hbox.add_child(slot)
		
		
func _on_focus_changed(control:Control) -> void:
	if control != null:
		selected_slot = control.get_parent()


func _toggle_inventory():
		var inventory_visible =  visible
		visible = !inventory_visible
		if not visible: 
			prev_selected_slot = selected_slot
			return
		for i in max_slots:
			hbox.get_child(i).item = inventory.items[i]
		_setup_btn_focus()


func _equip(slot: Inventory.EquipSlot):
	var curr_slot: VBoxContainer = selected_slot
	var idx = curr_slot.index
	prev_selected_slot = curr_slot
	if slot == Inventory.EquipSlot.PRIMARY:
		inventory.equip(idx, slot)
		primary_slot.update(inventory._primary)
	if slot == Inventory.EquipSlot.SECONDARY:
		inventory.equip(idx, slot)
		secondary_slot.update(inventory._secondary)
	curr_slot.update(inventory.items[idx])
	_setup_btn_focus()


func _pick_up(item) -> void:
	if inventory.is_full: return
	var idx = inventory.items.find(InventoryItem.EMPTY)
	inventory.update(item, idx)


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"inventory"):
		_toggle_inventory()
	#if event.is_action_released(&"inventory"):
		#_toggle_inventory()
	if event.is_action_pressed(&"equip_primary") and visible: 
		_equip(Inventory.EquipSlot.PRIMARY)
	if event.is_action_pressed(&"equip_seconday") and visible:
		_equip(Inventory.EquipSlot.SECONDARY)
	if event.is_action_pressed(&"pick_up") and pickup:
		_pick_up(pickup)
