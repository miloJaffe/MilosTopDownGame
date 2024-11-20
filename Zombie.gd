extends CharacterBody2D

const MOVE_SPEED = 200

@onready var raycast = $RayCast2D

var player = null

func _ready():
	pass
	
	



func _physics_process(delta):
	if player == null:
		return
	
	var vec_to_player = player.global_position - global_position
	vec_to_player = vec_to_player.normalized()
	global_rotation = atan2(vec_to_player.y, vec_to_player.x)
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
	
#	if raycast.is_colliding():
#		var coll = raycast.get_collider()
#		pass
		
		
		
#		if coll.name == "Player":
#			print("iscolldinigwhithplayer?")
#			coll.kill()

func kill():
	queue_free()

func set_player(p):
	player = p






func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.kill()
