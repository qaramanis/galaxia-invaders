extends ParallaxBackground

@onready var gameplay_background_layer: ParallaxLayer = $GameplayBackgroundLayer
@onready var gameplay_middleground_layer: ParallaxLayer = $GameplayMiddlegroundLayer
@onready var gameplay_foreground_layer: ParallaxLayer = $GameplayForegroundLayer

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	audio_stream_player.play()
	
func _process(delta: float) -> void:
	gameplay_background_layer.motion_offset.y += 2 * delta
	gameplay_middleground_layer.motion_offset.y += 5 * delta
	gameplay_foreground_layer.motion_offset.y += 10 * delta
