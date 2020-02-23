extends AnimationPlayer

func play_animation(animation_name: String) -> void:
	if animation_name in self.get_animation_list() and not self.current_animation == animation_name:
		self.play(animation_name)
