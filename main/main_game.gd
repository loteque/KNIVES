extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$UI/Status/Content/LifeBar.max_value = $Player.hp
	$UI/Status/Content/LifeBar.value = $Player.hp
	$Player.hp_changed.connect(_on_hp_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	$Camera2D.position = $Player.position


func _on_hp_changed(hp_new) -> void:
	$UI/Status/Content/LifeBar.value = hp_new
