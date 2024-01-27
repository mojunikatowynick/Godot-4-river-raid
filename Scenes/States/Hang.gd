extends State
class_name  VinesHang

@export var player: CharacterBody2D
@export var animator: Sprite2D


func Enter():
	animator.frame = 0
	player.gravity = 0

func Physics_update(_delta: float):

	if player.current_area == "vines":
		var direction = Input.get_vector("Left", "Right", "Up", "Down")
		player.velocity = player.climb_speed * direction
	elif player.current_area == null:
		Transitioned.emit(self, "Air")


	if Input.is_action_just_pressed("Catch"):
		Transitioned.emit(self, "Air")
	
	if Input.is_action_just_pressed("Jump"):
		player.velocity.y = player.jump_speed
		Transitioned.emit(self, "Air")
	
func Exit():
	player.gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
