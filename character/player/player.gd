extends KinematicBody2D

class_name Player
export(Vector2) var BOX = Vector2(4, 4)
func move(velocity: Vector2) -> void:
# warning-ignore:return_value_discarded
	self.move_and_slide(velocity)
