extends "res://util/stateMachine.gd"
class_name MovementStateMachine

func handle_input() -> void:
	self.get_current_state().handle_input(InputEvent)

func _physics_process(delta):
	if self._active:
		self.handle_input()
		self.get_current_state().move(delta)
