extends StaticBody2D

var speed: int = 50
var speed_multiplayer: float = 1.02

#func _ready():
#	$BGLifeTimer.start()

func _process(delta):
	position.y += speed * delta
	if Input.is_action_just_pressed("Alt_shoot"):
		speed = 0

#func _on_bg_life_timer_timeout():
#	queue_free()
