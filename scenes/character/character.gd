extends CharacterBody2D

@export var animation: AnimatedSprite2D

var _speed: float = 100.0
var _jump_speed: float = -300.0

func _physics_process(delta: float) -> void:
	#velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		_set_jump(_jump_speed)
	
	if Input.is_action_pressed("ui_right"):
		_set_run(_speed)
		animation.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		_set_run(-_speed)
		animation.flip_h = true
	else:
		velocity.x = 0
	move_and_slide()
	
	if velocity.x != 0:
		animation.play("run")
	else:
		animation.play("idle")

func _set_run(current_speed: float) -> void:
	velocity.x = current_speed

func _set_jump(current_jump_speed: float) -> void:
	velocity.y = current_jump_speed
