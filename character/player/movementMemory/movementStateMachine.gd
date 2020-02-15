extends "res://util/stateMachine.gd"
class_name MovementStateMachine


func _physics_process(delta):
	if self._active:
		self.get_current_state().handle_input()
		self.get_current_state().move(delta)
