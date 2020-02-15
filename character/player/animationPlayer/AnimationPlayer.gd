extends AnimationPlayer

func play_animation(animation_name: String) -> void:
	if not self.current_animation == animation_name:
		self.play(animation_name)
