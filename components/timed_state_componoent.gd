class_name TimedStateComponent
extends StateComponent

@export var duration: float = 1.0

var timer: = Timer.new()

func _ready() -> void:
	add_child(timer)
	timer.timeout.connect(func():
		state_finished.emit()
		disable()
	)
	
	enabled.connect(timer.start.bind(duration))
