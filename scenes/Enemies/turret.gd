extends CharacterBody2D

var turret_life: int = 5
var gun_ready_turret: bool = true

@onready var bullet_scene = preload("res://scenes/bullet.tscn")

func _process(delta):
	position.y += Global.scroll_speed*delta
	if turret_life > 0:
		var gun_marker_turret = $TurretBody/GunMarkerTurret
		var direction: Vector2 = (Global.plane_pos - global_position).normalized()
		var pos: Vector2 = gun_marker_turret.global_position
		if gun_ready_turret:
#			gun_shoot_turret.emit(pos, direction)
			var bullet = bullet_scene.instantiate() as Area2D
			bullet.position = pos
			bullet.direction = direction
			$Projectiles.add_child(bullet)
			gun_ready_turret = false
			$GunTimerTurret.start()
			print("marker", pos)
			print("self", position)
	else:
		Global.score += 1
		queue_free()

func hit():
	turret_life -= 1
	$AudioStreamPlayer2D.play()

func _on_gun_timer_turret_timeout():
	gun_ready_turret = true
	

