extends StaticBody2D

class_name Obstacle

func destroy() -> void:
	self.queue_free()
