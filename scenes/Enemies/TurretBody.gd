extends Node2D

var gun_ready_turret: bool = true
signal turret_shoot(direction, pos)

func _process(_delta):
	look_at(Global.plane_pos)
	if gun_ready_turret:
		var turret_marker = $GunMarkerTurret
		var direction: Vector2 = (Global.plane_pos - global_position).normalized()
		var pos: Vector2 = turret_marker.global_position
		turret_shoot.emit(direction, pos)
		gun_ready_turret = false
		$"../GunTimerTurret2".start()


func _on_gun_timer_turret_timeout():
	gun_ready_turret = true
