extends Node2D

@onready var bullet_scene = preload("res://scenes/bullet.tscn")
@onready var plane_scene = preload("res://scenes/plane.tscn")
@onready var background_scene = preload("res://scenes/background_1.tscn")

var game_ready: bool = true

func _on_plane_gun_shoot(gun_marker):
	shoot_main(gun_marker)

func shoot_main(gun_marker):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = gun_marker
	$Projectiles.add_child(bullet)


func _on_area_2d_body_entered(body):
	var background = background_scene.instantiate() as StaticBody2D
	background.position = $SpawnMarker.position
	$SpawnBGArea.call_deferred("add_child", background)
	print(body)
