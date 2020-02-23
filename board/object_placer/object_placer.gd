extends Node

class_name ObjectPlacer

var obstacle_packed_scene: PackedScene = preload("res://game_objects/obstacle/Obstacle.tscn")
var life_chest_p_scene: PackedScene = preload("res://game_objects/chest/life_chest/LifeChest.tscn")
var boost_chest_p_scene: PackedScene = preload("res://game_objects/chest/bomb_booster_chest/BombBoosterChest.tscn")
var game_board: Board

func _ready():
	self.organize_obstacle_cells(not self.game_board.PATTERN_ON_OFF,
	self.game_board.board_size)

func _on_Board_board_created(board):
	self.game_board = board

func organize_obstacle_cells(flag: bool, matrix_size: Vector2) -> void:
	var i = 1
	var j = 0
	var pattern = flag
	var cell: Cell
	var obstacle: Obstacle
	var matrix_of_cells: Array = self.game_board.matrix_of_cells
	while i < matrix_size.y-1:
		if pattern:
			j = 0
		else:
			j = 1
		while j < matrix_size.x:
			cell = matrix_of_cells[i][j]
			obstacle = self.obstacle_packed_scene.instance()
			self.game_board.add_child(obstacle)
			obstacle.global_position = cell.global_position
			j += 2
		pattern = not pattern
		i += 1
