extends Node2D

@onready var bullet_scene = preload("res://scenes/bullet.tscn")
@onready var plane_scene = preload("res://scenes/plane.tscn")
@onready var brick_scene = preload("res://scenes/brick.tscn")
@onready var turret_scene = preload("res://scenes/Enemies/turret_4.tscn")
@onready var suicide_scene = preload("res://scenes/Enemies/suicide.tscn")
@onready var spawn_marker_enemies = $SpawnPoints/SpawnMarkerEnemies
@onready var enemy_list = [suicide_scene, turret_scene]

var game_ready: bool = true

func _on_plane_gun_shoot(gun_marker):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = gun_marker
	$Projectiles.add_child(bullet)

func _on_spawn_timer_enemies_timeout():
	var enemy = enemy_list.pick_random().instantiate() as CharacterBody2D
	enemy.position = spawn_marker_enemies.global_position
	$Enemies.add_child(enemy)
	var new_wait_time = randi_range(1, 4)
	$Timers/SpawnTimerEnemies.start(new_wait_time)
	spawn_marker_enemies.position.x = randi_range(50,1230)

