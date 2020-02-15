extends "res://util/state.gd"
signal move_dir_animation(animation_name)
class_name Walking
const ANI_NAMES: Dictionary = {Vector2(0, -1): "North",
 Vector2(0, 1): "South", Vector2(-1, 0): "West", Vector2(1, 0): "East"}
export(float) var MAX_SPEED = 0.0
export(float) var ACCELERATION = 0.0
var move_dir: Vector2 = Vector2()
var utilFunctions: UtilFunctions = UtilFunctions.new()

func walk_x_dir(input: InputEvent) -> Vector2:
	return Vector2(
		self.utilFunctions.substract(int(input.is_action_pressed("ui_right")),
		int(input.is_action_pressed("ui_left"))), 0)

func walk_y_dir(input: InputEvent) -> Vector2:
	return Vector2(0,
	 self.utilFunctions.substract(int(input.is_action_pressed("ui_down")),
	int(input.is_action_pressed("ui_up"))))

func handle_input(input: InputEvent):
	var move_x_dir = self.walk_x_dir(input)
	var move_y_dir = self.walk_y_dir(input)
	if move_x_dir:
		self.move_dir = move_x_dir
		self.emit_signal("move_dir_animation", self.ANI_NAMES[move_x_dir])
	elif move_y_dir:
		self.move_dir = move_y_dir
		self.emit_signal("move_dir_animation", self.ANI_NAMES[move_y_dir])
	elif not move_x_dir and not move_y_dir:
		self.emit_signal("finished", "Idle")
		self.emit_signal("move_dir_animation",
		 "Idle"+self.ANI_NAMES[self.move_dir])
		self.move_dir = Vector2()
