extends Sprite

class_name Explosion



func _ready():
	$Timer.start()

func _on_Area2D_body_entered(body):
	if body.has_method("destroy"):
		body.destroy()

func _on_Area2D_area_entered(area):
	if area.has_method("destroy"):
		area.destroy()


func _on_Timer_timeout():
	self.queue_free()
