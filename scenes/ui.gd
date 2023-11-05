extends CanvasLayer

@onready var score_label:Label  = $Score/HBoxContainer/ScoreLabel
@onready var ammo_label:Label  = $MachineGun/HBoxContainer/AmmoLabel
@onready var time_label:Label  = $Time/HBoxContainer2/TimeLabel
@onready var life_label:Label = $Life/HBoxContainer3/LifeLabel
@onready var game_over_label:Label = $GameOver/HBoxContainer3/GameOver
@onready var rockets_label:Label = $Rockets/HBoxContainer/RocketsLabel
@onready var health_bar: TextureProgressBar = $MarginContainer/HealthBar

func _ready():
	update()
	Global.connect("stat_changed", update)
	Global.connect("game_over", game_over)

func update():
	update_score()
	update_life()
	update_ammo()
	update_rocket()
	update_health()

func update_score():
	score_label.text = str(Global.score)

func update_life():
	life_label.text = str(Global.player_life)

func update_ammo():
	ammo_label.text = str(Global.gun_ammo)
	
func update_rocket():
	rockets_label.text = str(Global.rocket_ammo)
	
func update_health():
	health_bar.value = Global.plane_life
	
func game_over():
	game_over_label.visible = true
	

