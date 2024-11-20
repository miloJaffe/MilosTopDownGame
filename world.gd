extends Node

@export var z_scene: PackedScene

var wave = 6
var num = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_zombies(wave)
	get_tree().paused = true
	$Menu/PopupMenu.show()
	if get_tree().paused == false:
		print("spawning")
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
	
	
func _on_timer_timeout():
	$GPUParticles2D.emitting = false
	print("timed out")
func spawn_zombies(num):
	get_tree().paused = false
	for i in range (num):
		var z = z_scene.instantiate()
		z.add_to_group("zombies")
		z.position = Vector2(randf_range(0, get_viewport().size.x),0)
		add_child(z)
func _on_popup_menu_id_pressed(Play):
	$Menu/PopupMenu.hide()
	get_tree().paused = false
#	if get_tree().paused == false:	
#	$Menu/PopupMenu.hide()

	
