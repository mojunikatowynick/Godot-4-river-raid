extends ParallaxBackground

func _process(delta):
	scroll_offset.y += Global.scroll_speed*delta
