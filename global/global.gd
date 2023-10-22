extends Node

signal stat_changed
signal plane_crash
signal game_over

var plane_life = 100
var scroll_speed = 100
var background_on: bool = true

var player_life = 1:
	set(value):
		player_life = value
		plane_crash.emit()
		stat_changed.emit()
		if player_life <= 0:
			game_over.emit()
			
var gun_ammo = 1000:
	set(value):
		gun_ammo = value
		stat_changed.emit()

var rocket_ammo = 3:
	set(value):
		gun_ammo = value
		stat_changed.emit()

var score = 0:
	set(value):
		score = value
		stat_changed.emit()

func _process(_delta):
	if plane_life <= 0:
		player_life -=1


