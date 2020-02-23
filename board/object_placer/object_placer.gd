extends Node

class_name ObjectPlacer

export(int) var CHOICE_OBJECT: int = 10
export(int) var CHOICE_CHEST_TYPE: int = 10
export(Array) var CHOICE_CHEST_INTERVAL: Array  = [0, 1, 2]
export(Array) var CHOICE_LIFE_CHEST_INTERVAL: Array = [0, 1, 2] 
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
	var matrix_of_cells: Array = self.game_board.matrix_of_cells
	while i < matrix_size.y-1:
		if pattern:
			j = 0
		else:
			j = 1
		while j < matrix_size.x:
			cell = matrix_of_cells[i][j]
			self.place_object(cell)
			j += 2
		pattern = not pattern
		i += 1

func place_obstacle(cell: Cell) -> void:
	var obstacle: Obstacle
	obstacle = self.obstacle_packed_scene.instance()
	self.game_board.add_child(obstacle)
	obstacle.global_position = cell.global_position
	

func place_chest(chest_packed_scene: PackedScene, cell: Cell) -> void:
	var chest: Chest = chest_packed_scene.instance()
	self.game_board.add_child(chest)
	chest.global_position = cell.global_position

func place_obstacle_and_chest(cell: Cell) -> void:
	var type_chest: int = randi() % self.CHOICE_CHEST_TYPE
	if type_chest in self.CHOICE_LIFE_CHEST_INTERVAL:
		self.place_chest(self.life_chest_p_scene, cell)
	else:
		self.place_chest(self.boost_chest_p_scene, cell)
	self.place_obstacle(cell)

func place_object(cell: Cell) -> void:
	var choice: int = randi() % self.CHOICE_OBJECT
	if choice in self.CHOICE_CHEST_INTERVAL:
		self.place_obstacle_and_chest(cell)
	else:
		self.place_obstacle(cell)
