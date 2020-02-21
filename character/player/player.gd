extends KinematicBody2D
class_name Player

var bomb_point: Position2D

func _ready():
	self.bomb_point = $BombPoint

func move(velocity: Vector2) -> void:
# warning-ignore:return_value_discarded
	self.move_and_slide(velocity)
