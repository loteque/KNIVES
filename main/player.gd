extends CharacterBody2D

const SPEED = 300.0

signal hp_changed
signal player_died

var damage : int = 1
var inventory : Dictionary = {}
var hp : int = 10 :
	set(val):
		hp = max(0, val)
		if hp == 0:
			player_died.emit()
			process_mode = Node.PROCESS_MODE_DISABLED
		else:
			hp_changed.emit(hp)

var _flipped : bool = false :
	set(val):
		_flipped = val
		$PlayerBody.flip_h = _flipped


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		_attack()
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		_flipped = (velocity.x < 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()


func _attack():
	if _flipped:
		$AnimationPlayer.play("attack_left")
	else:
		$AnimationPlayer.play("attack_right")


func _on_hurt_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.hp -= damage
