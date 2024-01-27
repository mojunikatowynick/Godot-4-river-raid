extends Area2D
var area = "ledge"

func _on_body_entered(body):
	ledge_position()
	
	if "area_check" in body:
		body.area_check(area)
	else :
		pass

func _on_body_exited(body):
	
	if "area_clear" in body:
		body.area_clear()
	else :
		pass
		
func ledge_position():
	Global.ledge_posittion = $LedgePos.global_position
