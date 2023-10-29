extends Node2D

@onready var bullet_scene = preload("res://scenes/bullet.tscn")
@onready var plane_scene = preload("res://scenes/plane.tscn")
@onready var brick_scene = preload("res://scenes/brick.tscn")
@onready var spawn_marker = $SpawnPoints/SpawnMarker1

var game_ready: bool = true

func _on_plane_gun_shoot(gun_marker):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = gun_marker
	$Projectiles.add_child(bullet)

func _on_spawn_timer_timeout():
	var enemy = brick_scene.instantiate() as StaticBody2D
	enemy.position = spawn_marker.global_position
	$Enemies.add_child(enemy)
	var new_wait_time = randi_range(1, 4)
	$Timers/SpawnTimer.start(new_wait_time)
	spawn_marker.position.x = randi_range(50,1230)
	
func _on_turret_turret_shoot(direction, pos):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.direction = direction
	bullet.position = pos
	$projectiles.add_child(bullet)
