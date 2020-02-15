extends "res://util/state.gd"
signal move_dir_animation(animation_name)
signal move(velocity)
class_name Walking
const ANI_NAMES: Dictionary = {Vector2(0, -1): "North",
 Vector2(0, 1): "South", Vector2(-1, 0): "West", Vector2(1, 0): "East",
Vector2(0, 0): "Idle"}
export(float) var MAX_SPEED = 0.0
export(float) var ACCELERATION = 0.0
var move_dir: Vector2 = Vector2()
var last_move_dir: Vector2 = Vector2(0, 1)
var utilFunctions: UtilFunctions = UtilFunctions.new()
var speed: float = 0.0

func exit() -> void:
	self.speed = 0.0

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
		self.last_move_dir = move_dir
		self.move_dir = move_x_dir
		self.emit_signal("move_dir_animation",
		 self.name + self.ANI_NAMES[move_x_dir])
	elif move_y_dir:
		self.last_move_dir = move_dir
		self.move_dir = move_y_dir
		self.emit_signal("move_dir_animation",
		 self.name + self.ANI_NAMES[move_y_dir])
	elif not move_x_dir and not move_y_dir:
		self.emit_signal("move_dir_animation",
		 self.ANI_NAMES[Vector2()] + self.ANI_NAMES[self.last_move_dir])
		self.move_dir = Vector2()

func move(delta: float) -> void:
	if self.move_dir:
		if self.move_dir.x > 0 or self.move_dir.y > 0:
			self.speed = self.utilFunctions.calculate_speed_with_range(0.0,
			self.MAX_SPEED, self.speed, self.ACCELERATION, delta)
		elif self.move_dir.x < 0 or self.move_dir.y < 0:
			self.speed = self.utilFunctions.calculate_speed_with_range(
			-self.MAX_SPEED, 0.0, self.speed, -self.ACCELERATION, delta)
		print(speed)
		self.emit_signal("move", self.move_dir*abs(self.speed))
	else:
		self.emit_signal("finished", "Idle")
