extends Node
# warning-ignore:unused_signal
signal bomb_boosted(quantity)
# warning-ignore:unused_signal
signal got_life(quantity)
class_name ChestInteractor

export(Dictionary) var CHESTS_SIGNALS: Dictionary
var current_chest: Chest

func _on_Player_on_chest(chest: Chest) -> void:
	self.current_chest = chest

func _on_Player_out_of_chest() -> void:
	self.current_chest = null

func communicate_content(chest_name: String, chest_content) -> void:
	if chest_name in self.CHESTS_SIGNALS.keys():
		self.emit_signal(self.CHESTS_SIGNALS[chest_name], chest_content)

func get_chest_content() -> void:
	if self.current_chest and self.current_chest.has_content():
		var content = self.current_chest.open_chest()
		self.communicate_content(self.current_chest.chest_name, content)
		self.current_chest.content_taken()
		self.current_chest = null

# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("ui_open_chest"):
		self.get_chest_content()
