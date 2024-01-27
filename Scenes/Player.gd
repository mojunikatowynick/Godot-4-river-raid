extends CharacterBody2D
class_name Bro

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var move_speed: int = 200
@export var jump_speed: int = -550
@export var climb_speed: int = 100
@onready var start_area = self.global_position
var current_area

@onready var state = $StateMachine.current_state

func _physics_process(_delta):

	move_and_slide()
	if velocity.x > 0:
		$Sprite2D.scale.x = 1
	elif velocity.x < 0:
		$Sprite2D.scale.x = -1
	state = $StateMachine.current_state

	
func area_check(area):
	current_area = area
	
func area_clear():
	current_area = null

func death():
	self.position = start_area



