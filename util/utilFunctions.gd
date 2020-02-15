extends Node
class_name UtilFunctions

func mantain_in_range(lower_bound, upper_bound, number):
	if number <= lower_bound:
		return lower_bound
	if number >= upper_bound:
		return upper_bound
	return number


func calculate_speed(init_speed: float, accel: float,
 delta_time: float) -> float:
	return init_speed + accel*delta_time

func calculate_speed_with_range(lower_bound: float,
upper_bound: float, init_speed: float,
 accel: float, delta_time: float) -> float:
	var speed: float = self.calculate_speed(init_speed, accel, delta_time)
	return self.mantain_in_range(lower_bound, upper_bound, speed)

func calculate_delta(n_first, n_second):
	return n_second - n_first


func add(accumulated, current_value):
	return accumulated + current_value

func substract(accumulated, current_value):
	return accumulated - current_value
	
func from_bool_to_int(boolean_val: bool) -> int:
	return int(boolean_val)

func float_module(number1: float, number2: float) -> float:
	var mod : float = abs(number1)
	while(mod >= abs(number2)):
		mod -= abs(number2)
	return sign(number1)*mod

func combine_speed(speed_1: float, speed_2: float) -> float:
	return speed_1 + speed_2

func add_vectors(vector1: Vector2, vector2: Vector2) -> Vector2:
	return vector1 + vector2

func multiply_vector_by_scalar(scalar, vector: Vector2) -> Vector2:
	return vector*scalar

func has_reached_upper_bound(upperBound, number) -> bool:
	return number == upperBound
