extends Node

class_name CoordinatesConversor
var player_node
var board: Board

func _init(player_nod, game_board):
	self.player_node = player_nod
	self.board = game_board

func get_free_cells() -> Array:
	var cells = []
	if self.board:
		var cell_matrix = self.board.matrix_of_cells
		var board_size = self.board.board_size
		for i in board_size.y:
			for j in board_size.x:
				if not cell_matrix[i][j].is_occupied():
					var index = Tuple.new(i, j)
					cells.append(Tuple.new(index, cell_matrix[i][j]))
	return cells

func get_player_coordinates_on_board() -> Tuple:
	var board_coord: Tuple = Tuple.new(null, null)
	var free_cells = self.get_free_cells()
	var min_distance = null
	var cell: Cell
	for free_cell in free_cells:
		cell = free_cell.second_element
		var distance = cell.global_position.distance_to(
			self.player_node.global_position)
		if not min_distance:
			min_distance = distance
			board_coord = free_cell.first_element
		elif (distance <= min_distance):
			min_distance = distance
			board_coord = free_cell.first_element
	return board_coord
