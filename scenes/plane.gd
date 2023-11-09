extends CharacterBody2D

var speed = 500
var gun_ready: bool = true
var ammo: bool = true
var game_on: bool = true
var rocket_ready: bool = true
var rocket_ammo: bool = true
signal gun_shoot(gun_marker, target)
signal rocket_shoot(gun_marker)

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var burn = $Animations/Burn
	
func _ready():
	Global.connect("game_over", destroy)

func _process(_delta):
	
	Global.plane_pos = global_position
	
	if game_on:
		var tween = get_tree().create_tween()
		var direction = Input.get_vector("Move_left", "Move_right", "Move_up","Move_down")
		velocity = direction * speed
		move_and_slide()
		
		sprite.flip_h = (velocity.x >= 1)
		
#		if velocity.x > 0:
#			tween.tween_property($".", "rotation_degrees", 35, 0.5)
#		if velocity.x < 0:
#			tween.tween_property($".", "rotation_degrees", -35, 0.5)
		
		if velocity.x != 0:
			animation_player.play("turn")
		else:
			animation_player.play("idle")
#			tween.tween_property($".", "rotation_degrees", 0, 0.5)
			
		if Input.is_action_pressed("Shoot") and gun_ready and ammo:
			var gun_marker = $Marker/Gun
			var gun_aim = $Marker/Aim
			var target = (gun_aim.global_position - gun_marker.global_position).normalized()
			gun_shoot.emit(gun_marker.global_position, target)
			gun_ready = false
			Global.gun_ammo -= 1
			$Timer/GunTimer.start()
		
		if Input.is_action_pressed("Alt_shoot") and rocket_ready and rocket_ammo:
			var gun_marker = $Marker/Gun
			rocket_shoot.emit(gun_marker.global_position)
			rocket_ready = false
			Global.rocket_ammo -= 1
			$Timer/RocketTimer.start()
			
		if velocity.y <= -1:
			tween.tween_property(burn, "scale", Vector2(0.4, 1.2), 0.2)
		else:
			tween.tween_property(burn, "scale", Vector2(0.4, 0.4), 0.2)
		
		if Global.gun_ammo <= 0:
			ammo = false
		else:
			ammo = true
	
func destroy():
	if game_on:
		game_on = false
		animation_player.play("explosion")
	
func _on_gun_timer_timeout():
	gun_ready = true

func _on_rocket_timer_timeout():
	rocket_ready = true
	
func hit():
	Global.plane_life -= 10
