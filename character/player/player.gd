extends KinematicBody2D
signal place_bomb()
class_name Player

var bomb_point: Position2D

func _ready():
	self.bomb_point = $BombPoint

func move(velocity: Vector2) -> void:
# warning-ignore:return_value_discarded
	self.move_and_slide(velocity)

# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("ui_accept"):
		self.emit_signal("place_bomb")
