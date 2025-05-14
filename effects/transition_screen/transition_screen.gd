extends CanvasLayer

signal on_transition_finished

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect

func _ready():
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		animation_player.play("fade_to_normal")
		on_transition_finished.emit()
	elif anim_name == "fade_to_normal":
		color_rect.visible = false

func transition():
	color_rect.visible = true
	animation_player.play("fade_to_black")
	
