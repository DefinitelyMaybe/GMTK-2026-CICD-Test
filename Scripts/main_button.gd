extends Node2D

signal MainButtonPressed

func _on_button_pressed() -> void:
	MainButtonPressed.emit()
	AudioManager.play("button_press")
	#_count = clamp(_count + cool_count, 0, initial_count)
	#_count_down_label.text = str(_count)
	#texture_progress_bar.value = _count
	#count_down.start()
