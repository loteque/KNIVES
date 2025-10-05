extends CharacterBody2D

enum EnemyState {IDLE, HUNT, ATTACK, HIT}

const SPEED = 200.0

var think_time : float = 0.5
var cooldown_time : float = 1.0
var damage : int = 1

var _target : CharacterBody2D

var hp : int = 5 :
	set(val):
		hp = max(0, val)
		if hp == 0:
			_die()

var _flipped : bool = true :
	set(val):
		_flipped = val
		$EnemyBody.flip_h = _flipped

var _state : EnemyState = EnemyState.IDLE :
	set(val):
		_state = val
		match _state:
			EnemyState.IDLE:
				$Label.text = "IDLE"
			EnemyState.HUNT:
				$Label.text = "HUNT"
			EnemyState.ATTACK:
				$Label.text = "ATTACK"
			EnemyState.HIT:
				$Label.text = "HIT"


func _ready() -> void:
	$Think.start(think_time)


func _physics_process(_delta: float) -> void:
	if _state == EnemyState.HUNT:
		velocity = (_target.position - self.position)
		velocity.y = 0
		velocity = velocity.normalized() * SPEED
		_flipped = (velocity.x < 0)
		move_and_slide()


func _die():
	queue_free()


func _attack() -> void:
	if $Cooldown.is_stopped():
		$Cooldown.start(cooldown_time)
		if _flipped:
			$AnimationPlayer.play("attack_left")
		else:
			$AnimationPlayer.play("attack_right")


func _on_think_timeout() -> void:
	match _state:
		EnemyState.HUNT:
			if self.position.distance_to(_target.position) <= 160:
				_state = EnemyState.ATTACK
		EnemyState.ATTACK:
			_attack()


func _on_detect_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		_target = body
		_state = EnemyState.HUNT


func _on_detect_box_body_exited(body: Node2D) -> void:
	if body == _target:
		_target = null
		_state = EnemyState.IDLE


func _on_hurt_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hp -= damage
