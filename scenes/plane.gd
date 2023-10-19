extends CharacterBody2D

var speed = 500
var gun_ready: bool = true
var game_on: bool = true
signal gun_shoot(gun_marker)


@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var burn = $Animations/Burn

	

func _process(_delta):
	if game_on:
		var direction = Input.get_vector("Move_left", "Move_right", "Move_up","Move_down")
		velocity = direction * speed
		move_and_slide()
		
		sprite.flip_h = (velocity.x >= 1)
		
		if velocity.x != 0:
			animation_player.play("turn")
		else:
			animation_player.play("idle")
		


	
	if Input.is_action_pressed("Shoot") and gun_ready:
		var gun_marker = $Marker/Gun
		gun_shoot.emit(gun_marker.global_position)
		gun_ready = false
		Global.gun_ammo -= 1
		$Timer/GunTimer.start()
		
		
	var tween = get_tree().create_tween()
	
	if velocity.y <= -1:
		tween.tween_property(burn, "scale", Vector2(0.4, 1.2), 0.2)
	else:
		tween.tween_property(burn, "scale", Vector2(0.4, 0.4), 0.2)

func destroy():
	game_on = false
	animation_player.play("explosion")

	
func _on_gun_timer_timeout():
	gun_ready = true


