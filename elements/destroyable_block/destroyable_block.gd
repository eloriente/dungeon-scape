extends RigidBody2D

@export var raycast: RayCast2D
@export var raycast_down: RayCast2D
@export var block: RigidBody2D
var is_breaking := false

func _physics_process(delta: float) -> void:
	if is_breaking:
		return
	if raycast.get_collider() || raycast_down.get_collider():
			hit()

func hit():
	is_breaking = true
	break_block()

func break_block():
	quick_shake()
	await get_tree().create_timer(0.5).timeout
	
	visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	
	await get_tree().create_timer(1.0).timeout
	
	visible = true
	$CollisionShape2D.set_deferred("disabled", false)
	is_breaking = false
	

	await get_tree().process_frame 
	
	is_breaking = false
	raycast.enabled = true
	

func quick_shake():
	var tween = create_tween()
	for i in range(10):
		var random_pos = Vector2(randf_range(-1, 1), randf_range(-1, 1))
		tween.tween_property($Sprite2D, "position", random_pos, 0.05)
	tween.tween_property($Sprite2D, "position", Vector2.ZERO, 0.05)
