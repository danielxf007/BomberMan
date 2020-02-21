extends Sprite
signal exploded()
class_name Bomb

export(int) var TYPE: int = 1
var board_coordinates: Tuple

func _init(bomb_type: int, coodinates: Tuple):
	self.TYPE = bomb_type
	self.board_coordinates = coodinates

func _ready():
	$AnimationPlayer.play("placed_bomb")

func _on_PlacedBombTimer_timeout():
	$AnimationPlayer.play("bomb_ready_for_explosion")


func _on_ExplosionReadyTimer_timeout():
	self.emit_signal("exploded")
