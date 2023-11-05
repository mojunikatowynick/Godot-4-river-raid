extends Area2D

var speed: int = 100
var max_speed: int = 1000
var direction: Vector2 = Vector2.UP

func _ready():
	$Timer.start()

func _physics_process(delta):
	position += speed * delta * direction

func _on_body_entered(body):
	speed = 0
	print(body)
	$AnimationPlayer.play("Explosion")
	if "destroy_enemy" in body:
		body.destroy_enemy
	
func _on_timer_timeout():
	queue_free()
