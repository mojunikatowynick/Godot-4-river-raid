extends CharacterBody2D

var suicide_life = 5
var player_near: bool = false
var speed = Global.scroll_speed
var max_speed: int = 500
var speed_multiplayer: int = 1

func hit():
	suicide_life -= 1
	$AudioStreamPlayer2D.play()
	
func _process(delta):
	rotation_degrees += 50 * delta
	if suicide_life > 0:
		position.y += Global.scroll_speed*delta
	else:
		Global.score += 1
		queue_free()
	if player_near:
		move_and_collide(velocity * delta)
		var direction = (Global.plane_pos - position).normalized()
		velocity = direction * speed * speed_multiplayer

func _on_enemy_life_timeout():
	queue_free()

func _on_collision_area_body_entered(body):
	if "destroy" in body:
		body.destroy()
	$AnimationPlayer.play("Explosion")

func _on_detection_area_body_entered(_body):
	player_near = true
	var tween = create_tween()
	tween.tween_property(self, "speed", max_speed, 6)
	
func _on_detection_area_body_exited(_body):
	player_near = false
