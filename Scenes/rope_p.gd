extends RigidBody2D
class_name RopePiece

var body_in: bool = false
@export var swing_force: int = 100
var area = "line"
var current_rope_piece
var this_rope 
var this_pos


func _physics_process(_delta):
	#print(body_in)
	this_pos = self.global_position
	#print(this_pos)
	if body_in:
		rope_position()
		if Input.is_action_pressed("Right"):
			self.apply_force(Vector2.RIGHT * swing_force)
	
		if Input.is_action_pressed("Left"):
			self.apply_force(Vector2.LEFT * swing_force)
		
		#if Input.is_action_pressed("Up"):
			#current_rope_piece += 1
			#print(current_rope_piece)

func _on_player_detector_body_entered(body):

	this_rope = get_name()
	#print(this_rope)
	current_rope_piece = get_parent().rope_pieces.find(this_rope, 0)

	
	if body.state is Air:
		
		rope_position()
		if "area_check" in body:
			body.area_check(area)
			body_in = true
		else :
			pass
		#body_in = true
	elif body.state !=null:
		pass
	else:
		pass

func _on_player_detector_body_exited(body):

	if "area_clear" in body:
		body.area_clear()
	else :
		pass
	body_in = false

func rope_position():
	Global.current_rope_posittion = this_pos
