extends CharacterBody2D

var turret_life: int = 5
var gun_ready_turret: bool = true

@onready var bullet_scene = preload("res://scenes/bullet.tscn")

func hit():
	turret_life -= 1
	$AudioStreamPlayer2D.play()

func _process(delta):
	position.y += Global.scroll_speed*delta
	if turret_life > 0:
		var turret_marker = $TurretBody/GunMarker
		var direction: Vector2 = (Global.plane_pos - global_position).normalized()
		var pos: Vector2 = turret_marker.global_position.normalized()
		if gun_ready_turret:
			var bullet = bullet_scene.instantiate() as Area2D
			bullet.direction = direction
			bullet.position = pos
			$Projectiles.add_child(bullet)
			$GunTimerTurret.start()
			gun_ready_turret = false

	else:
		Global.score += 1
		queue_free()

func _on_gun_timer_turret_timeout():
		gun_ready_turret = true

func destroy_enemy():
	turret_life = 0
