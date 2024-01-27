extends State
class_name  LineHang

@export var player: CharacterBody2D
@export var animator: Sprite2D

var direction

func Enter():
	animator.frame = 0
	player.position = Global.current_rope_posittion
	
func Physics_update(_delta: float):
	
	if Input.is_action_just_released("Up"):
		pass

	elif Input.is_action_just_pressed("Down"):
		pass

	elif Input.is_action_just_pressed("Jump"):
		player.velocity.y = player.jump_speed
		Transitioned.emit(self, "Air")
		
	elif Input.is_action_just_pressed("Catch"):
		Transitioned.emit(self, "Air")
		
	else:
		player.velocity = Vector2.ZERO
		player.position = Global.current_rope_posittion
