extends Node2D
var area = "vines"

func _on_vines_body_entered(body):
	
	if "area_check" in body:
		body.area_check(area)
	else :
		pass

func _on_vines_body_exited(body):
	
	if "area_clear" in body:
		body.area_clear()
	else :
		pass


func _on_death_body_entered(body):
	if "death" in body:
		body.death()
