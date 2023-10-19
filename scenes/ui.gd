extends CanvasLayer

@onready var score_label = $Score/HBoxContainer/ScoreLabel
@onready var ammo_label = $MachineGun/HBoxContainer/AmmoLabel
@onready var time_label = $Time/HBoxContainer2/TimeLabel
@onready var life_label = $Life/HBoxContainer3/LifeLabel
@onready var game_over_label = $GameOver/HBoxContainer3/GameOver
@onready var rockets_label = $Rockets/HBoxContainer/RocketsLabel

func _ready():
	
	Global.connect("stat_changed", update)
	Global.connect("game_over", game_over)

func update():
	update_score()
	update_life()
	update_ammo()
	update_rocket()

func update_score():
	score_label.text = str(Global.score)

func update_life():
	life_label.text = str(Global.player_life)

func update_ammo():
	ammo_label.text = str(Global.gun_ammo)
	
func update_rocket():
	rockets_label.text = str(Global.rocket_ammo)
	
func game_over():
	game_over_label.visible = true
	

