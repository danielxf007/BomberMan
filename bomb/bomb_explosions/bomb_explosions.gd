extends Node

class_name BombExplosions

var explosionF: ExplosionF = ExplosionF.new()
var util_f: UtilFunctions = UtilFunctions.new()

func get_left_range(left_range: int, explosion_point: Tuple) -> Array:
	return range(explosion_point.first_element - left_range,
	explosion_point.first_element)

func get_right_range(right_range: int, explosion_point: Tuple) -> Array:
	return range(explosion_point.first_element +1,
	explosion_point.first_element + right_range) 

func get_up_range(up_range: int, explosion_point: Tuple) -> Array:
	return range(explosion_point.first_element - up_range,
	explosion_point.first_element)

func get_down_range(down_range: int, explosion_point: Tuple) -> Array:
	return range(explosion_point.first_element+1,
	explosion_point.first_element + down_range)

func get_explosion_row(explosion_range: Array, explosion_x: int,
row_cells: Array) -> Array:
	return self.explosionF.row_explosion(explosion_range, explosion_x,
	row_cells)

func get_explosion_column(explosion_range: Array, explosion_y: int,
columns_cells: Array) -> Array:
	return self.explosionF.column_explosion(explosion_range, explosion_y,
	columns_cells)

func get_row_explosion(_range: Array, explosion_point: Tuple,
matrix_of_cells: Array) -> Array:
	return self.get_explosion_row(
		_range, explosion_point.first_element,
		matrix_of_cells[explosion_point.second_element])

func get_column_explosion(_range: Array, explosion_point: Tuple,
matrix_of_cells: Array) -> Array:
	return self.get_explosion_column(_range, explosion_point.second_element,
	self.util_f.create_column_matrix(matrix_of_cells,
	 explosion_point.first_element))
