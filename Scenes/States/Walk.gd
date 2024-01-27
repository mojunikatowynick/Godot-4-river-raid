extends State
class_name  Walk

@export var player: CharacterBody2D
@export var animator: Sprite2D

var direction


func Enter():
	animator.frame = 0
	
func Physics_update(delta: float):
	
	player.velocity.y += player.gravity * delta

	direction = Input.get_axis("Left", "Right")
	player.velocity.x = direction * player.move_speed

	if Input.is_action_just_pressed("Jump") and player.is_on_floor():
		player.velocity.y = player.jump_speed
		Transitioned.emit(self, "Air")
