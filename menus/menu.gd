extends Control


func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished


		get_tree().change_scene_to_file("res://world.tscn")
