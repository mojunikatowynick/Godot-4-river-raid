extends StaticBody2D

var brick_life = 3

func hit():
	brick_life -= 1
	$explosion.frame += 1
	$AudioStreamPlayer2D.play()
	
func _process(delta):
	if brick_life > 0:
		position.y += Global.scroll_speed*delta
	else:
		Global.score += 1
		queue_free()

func _on_collission_body_entered(body):
	if "destroy" in body:
		body.destroy()


func _on_enemy_life_timeout():
	queue_free()
