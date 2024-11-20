extends CharacterBody2D
const MOVE_SPEED = 300

@onready var raycast = $RayCast2D
func _ready():
	await(get_tree().process_frame)
	await(get_tree().process_frame)
	await(get_tree().process_frame)
	await(get_tree().process_frame)
	
	get_tree().call_group("zombies", "set_player", self)

func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * MOVE_SPEED * delta)
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)
		
	if Input.is_action_just_pressed("shoot"):
		$CPUParticles2D.emitting = true
		var coll = raycast.get_collider()
		if raycast.is_colliding() and coll.has_method("kill"):
			print("killingozmbies")
			coll.kill()
			await(get_tree().process_frame)


		
func kill():
	get_tree().paused = true


func _on_timer_timeout():
	$CPUParticles2D.emitting = false
	print("timed out")
