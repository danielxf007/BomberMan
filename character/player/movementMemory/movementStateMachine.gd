extends "res://util/stateMachine.gd"


func handle_input() -> void:
	self.get_current_state().handle_input(InputEvent)

func _physics_process(delta):
	if self._active:
		self.handle_input()
