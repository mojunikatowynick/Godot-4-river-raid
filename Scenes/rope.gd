extends StaticBody2D

@export var swing_force: int = 100
@onready var rope_pieces = []
var array = []
var rope = null
#var current_rope
var test_name

func _ready():

	
	for child in self.get_children(): 
		if child is RigidBody2D:
			var child_name = child.get_name()
			rope_pieces.push_back(child_name)
	
	print(self.get_child(3).global_position)
	
	#print(rope_pieces)
	#current_rope = rope_pieces.find("RopeP", 0)
	#var this = rope_pieces.find("RopeP")
	#var this2 = $RopeP
	#print(this2.global_position)

#func _process(_delta):
	#print(current_rope)


