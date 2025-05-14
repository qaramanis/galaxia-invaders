class_name ShakeComponent
extends Node

@export var node: Node2D
@export var shake_amount: = 2.0
@export var shake_duration: = 0.4

var shake = 0

func tween_shake():
	shake = shake_amount
	
	var tween = create_tween()
	tween.tween_property(self, "shake", 0.0, shake_duration).from_current()

func _physics_process(delta: float) -> void:
	node.position = Vector2(randf_range(-shake, shake), randf_range(-shake, shake))
