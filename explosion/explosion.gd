extends Sprite

class_name Explosion



func _on_Area2D_body_entered(body):
	if body.has_method("destroy"):
		body.destroy()

func _on_Area2D_area_entered(area):
	if area.has_method("destroy"):
		area.destroy()
