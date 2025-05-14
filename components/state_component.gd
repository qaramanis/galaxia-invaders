class_name StateComponent
extends Node

signal enabled()
signal disabled()
signal state_finished()

func disable() -> void:
	disabled.emit()
	process_mode = Node.PROCESS_MODE_DISABLED

func enable() -> void:
	enabled.emit()
	process_mode = Node.PROCESS_MODE_INHERIT
