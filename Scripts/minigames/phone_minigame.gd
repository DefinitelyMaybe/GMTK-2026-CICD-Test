extends Area2D

signal showDialogue

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _input_event(viewport: Viewport, event: InputEvent, shape_index: int):
	var event_is_mouse_click: bool = (
		event is InputEventMouseButton and
		event.button_index == MOUSE_BUTTON_LEFT and
		event.is_pressed()
	)

	if event_is_mouse_click:
		open_dialogue_box()
		
func open_dialogue_box():
	pass

func trigger_phone_call() -> void:
	await get_tree().create_timer(5.0).timeout
	AudioManager.play("phone_ringing")
	animated_sprite_2d.play("ringing_with_outline")
	await get_tree().create_timer(5.0).timeout
	animated_sprite_2d.play("idle")
	AudioManager.stop_sfx("phone_ringing")
	showDialogue.emit()
	#dialog.show()
	#dialog.show_text(0)
