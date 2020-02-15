extends KinematicBody2D

class_name Player

func move(velocity: Vector2) -> void:
# warning-ignore:return_value_discarded
	self.move_and_slide(velocity)
