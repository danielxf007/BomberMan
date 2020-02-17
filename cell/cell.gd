extends Sprite

class_name Cell

var element
var cell_size: Vector2
var area2D

func _ready():
	self.area2D = $Area2D

func set_element(new_element) -> void:
	if not self.element:
		self.element = new_element

func clear_element() -> void:
	self.element = null

func _on_Area2D_area_entered(area):
	self.set_element(area)

func _on_Area2D_body_entered(body):
	self.set_element(body)


# warning-ignore:unused_argument
func _on_Area2D_area_exited(area):
	self.clear_element()


# warning-ignore:unused_argument
func _on_Area2D_body_exited(body):
	self.clear_element()
