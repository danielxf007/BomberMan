extends KinematicBody2D
signal on_chest(chest)
signal out_of_chest()
class_name Player

var bomb_point: Position2D

func _ready():
	self.bomb_point = $BombPoint

func move(velocity: Vector2) -> void:
# warning-ignore:return_value_discarded
	self.move_and_slide(velocity)

func on_chest(chest: Chest) -> void:
	self.emit_signal("on_chest", chest)

func out_of_chest() -> void:
	self.emit_signal("out_of_chest")
