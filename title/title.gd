extends Control

@onready var submenus = {
	"main": $Content/Main,
	"load": $Content/Load,
	"options": $Content/Options,
}
@onready var sliders = {
	"music": {
		"control": $Content/Options/List/Music,
		"label": $Content/Options/List/MusicNum
	},
	"sfx": {
		"control": $Content/Options/List/SFX,
		"label": $Content/Options/List/SFXNum
	},
	"ui": {
		"control": $Content/Options/List/UI,
		"label": $Content/Options/List/UINum
	},
}

var current_submenu : String = "main" : 
	set(val):
		if val in submenus.keys():
			current_submenu = val
			for sub in submenus.keys():
				submenus[sub].visible = (sub == current_submenu)


func _ready() -> void:
	current_submenu = "main"
	if OS.get_name() == "Web":
		$Content/Main/BtnQuit.hide()
	for slider in sliders.keys():
		sliders[slider].control.value_changed.connect(_on_slider_changed.bind(slider))


func _on_btn_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://main/main.tscn")


func _on_btn_load_game_pressed() -> void:
	current_submenu = "load"


func _on_btn_options_pressed() -> void:
	current_submenu = "options"


func _on_btn_quit_pressed() -> void:
	get_tree().quit()


func _on_slider_changed(val: float, type: String) -> void:
	if type in sliders.keys():
		AudioServer.set_bus_volume_linear(AudioServer.get_bus_index(type), val)
		sliders[type].label.text = str(int(val * 100))


func _on_btn_back_pressed() -> void:
	current_submenu = "main"
