extends Area2D

signal LightsOut

@onready var switch: AnimatedSprite2D = $Switch
@onready var blackout_timer: Timer = $blackout_timer

@export var minimum_light_time: float = 5.0
@export var maximum_light_time: float = 15.0

var lightsOn = true

func _ready() -> void:
	start_random_blackout()

func start_random_blackout() -> void:
	# Pick a random number of seconds
	var random_time = randf_range(minimum_light_time, maximum_light_time)
	# Start the timer with random time number
	blackout_timer.start(random_time)

func force_lights_out() -> void:
	switch.play("Switch_off")
	LightsOut.emit()
	# dont do this. changing state from this script creates hard to follow logic.
	#main_button.disabled = true

func _on_input_event(event: InputEvent) -> void:
	var event_is_mouse_click: bool = (
		event is InputEventMouseButton and
		event.button_index == MOUSE_BUTTON_LEFT and
		event.is_pressed()
	)

	if event_is_mouse_click:
		toggle_switch()

func toggle_switch() -> void:
	if lightsOn:
		force_lights_out()
		blackout_timer.stop()
		lightsOn = false
	else: 
		switch.play("switch_on")
		lightsOn = true
		start_random_blackout()

func _on_blackout_timer_timeout() -> void:
	if lightsOn:
		force_lights_out()
