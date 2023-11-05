extends Node2D

@onready var bullet_scene = preload("res://scenes/bullet.tscn")
@onready var rocket_scene = preload("res://scenes/rocket.tscn")
@onready var plane_scene = preload("res://scenes/plane.tscn")
@onready var brick_scene = preload("res://scenes/brick.tscn")
@onready var turret_scene = preload("res://scenes/Enemies/turret_4.tscn")
@onready var suicide_scene = preload("res://scenes/Enemies/suicide.tscn")
@onready var spawn_marker_enemies = $SpawnPoints/SpawnMarkerEnemies
@onready var spawn_marker_turrets = $SpawnPoints/SpawnMarkerTurret
@onready var enemy_list = [suicide_scene]

var game_ready: bool = true

func _on_plane_gun_shoot(gun_marker, target):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = gun_marker
	bullet.direction = target 
	$Projectiles.add_child(bullet)

func _on_spawn_timer_enemies_timeout():
	var new_wait_time = randi_range(1, 4)
	spawn_marker_enemies.position.x = randi_range(50,1230)
	var enemy = enemy_list.pick_random().instantiate() as CharacterBody2D
	enemy.position = spawn_marker_enemies.global_position
	$Enemies.add_child(enemy)
	$Timers/SpawnTimerEnemies.start(new_wait_time)
	
func _on_spawn_timer_turrets_timeout():
	var range_marker = [50,180]+[1175, 1250]
	spawn_marker_turrets.position.x = range_marker.pick_random()
	var enemy = turret_scene.instantiate() as CharacterBody2D
	enemy.position = spawn_marker_turrets.global_position
	$Enemies.add_child(enemy)
	var new_wait_time = randi_range(1, 4)
	$Timers/SpawnTimerTurrets.start(new_wait_time)

func _on_plane_rocket_shoot(gun_marker):
	var rocket = rocket_scene.instantiate() as Area2D
	rocket.position = gun_marker
	$Projectiles.add_child(rocket)
