extends CanvasLayer


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	
func _on_controls_pressed():
	get_tree().change_scene_to_file("res://scenes/remap_menu.tscn")
	
func _on_high_score_pressed():
	pass 

func _on_exit_pressed():
	get_tree().quit()
