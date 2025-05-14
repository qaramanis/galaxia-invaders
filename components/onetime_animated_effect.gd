class_name OnetimeAnimatedEffect
extends AnimatedSprite2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	audio_stream_player.play()
	animation_finished.connect(queue_free)
	animation_looped.connect(queue_free)
