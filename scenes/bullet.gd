extends Area2D

var speed: int = 900
var direction: Vector2 = Vector2.UP

func _ready():
	$BulletLife.start()

func _physics_process(delta):
	position += speed * delta * direction

func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	$explosion.visible = true
	speed = 0
	$GPUParticles2D.emitting = true
	$PointLight2D.energy = 100
	await get_tree().create_timer(0.2).timeout
	queue_free()
	print(body)

func _on_bullet_life_timeout():
	queue_free()
