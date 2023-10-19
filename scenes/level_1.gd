extends Node2D

@onready var bullet_scene = preload("res://scenes/bullet.tscn")
@onready var plane_scene = preload("res://scenes/plane.tscn")

var game_ready: bool = true

func _on_plane_gun_shoot(gun_marker):
	shoot_main(gun_marker)


func shoot_main(gun_marker):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = gun_marker
	$Projectiles.add_child(bullet)

	

