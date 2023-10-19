extends StaticBody2D

var brick_life = 3

func hit():
	brick_life -= 1
	$explosion.frame += 1
	$AudioStreamPlayer2D.play()
	
func _process(_delta):
	if brick_life <= 0:
		Global.score += 1
		queue_free()

func _on_collission_body_entered(body):
	if "destroy" in body:
		body.destroy()
