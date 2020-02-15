extends "res://util/state.gd"
class_name Idle
var utilFunctions: UtilFunctions = UtilFunctions.new()
func walk_x_dir() -> Vector2:
	return Vector2(
		self.utilFunctions.substract(int(Input.is_action_pressed("ui_right")),
		int(Input.is_action_pressed("ui_left"))), 0)

func walk_y_dir() -> Vector2:
	return Vector2(0,
	 self.utilFunctions.substract(int(Input.is_action_pressed("ui_down")),
	int(Input.is_action_pressed("ui_up"))))

func handle_input() -> void:
	var move_x_dir = self.walk_x_dir()
	var move_y_dir = self.walk_y_dir()
	if move_x_dir:
		self.emit_signal("finished", "Walking")
	elif move_y_dir:
		self.emit_signal("finished", "Walking")

# warning-ignore:unused_argument
func move(delta: float) -> void:
	pass
