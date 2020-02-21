extends Node

class_name BombPlacerSystem

export(NodePath) var PLAYER_NODE_PATH
export(int) var BOMB_TYPE: int = 1
export(float) var COOL_DOWN: float = 2.0
var bomb_packed_scene: PackedScene = preload("res://bomb/Bomb.tscn")
var player: Player
var game_board: Board
var util_f: UtilFunctions = UtilFunctions.new()


func _ready():
	self.player = self.get_node(self.PLAYER_NODE_PATH)
	$Timer.wait_time = self.COOL_DOWN

func _on_Board_board_created(board):
	self.game_board = board

func can_place_bomb(cell: Cell, bomb_point_pos: Vector2) -> bool:
	return (not cell.is_occupied() and 
	self.util_f.point_inside_box(cell.global_position,
	cell.cell_container_size.x, cell.cell_container_size.y, bomb_point_pos))

func place_bomb() -> void:
	if $Timer.is_stopped():
		var coordinate_c: CoordinatesConversor = CoordinatesConversor.new(
			self.player, self.game_board)
		var player_coord: Tuple = coordinate_c.get_player_coordinates_on_board()
		var i_coord = player_coord.first_element
		var j_coord = player_coord.second_element
		var bomb_point: Position2D = self.player.bomb_point
		if self.can_place_bomb(self.game_board.matrix_of_cells[i_coord][j_coord],
		bomb_point.global_position):
			var board_coordinates: Tuple = Tuple.new(i_coord, j_coord)
			var bomb: Bomb = self.bomb_packed_scene.instance()
			bomb.TYPE = self.BOMB_TYPE
			bomb.board_coordinates = board_coordinates
			bomb.game_board = self.game_board
			self.game_board.add_child(bomb)
			bomb.global_position = bomb_point.global_position
			$Timer.start()

# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("ui_accept"):
		self.place_bomb()
