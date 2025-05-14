extends ParallaxBackground

@onready var space_background_layer: ParallaxLayer = $SpaceBackgroundLayer
@onready var space_middleground_layer: ParallaxLayer = $SpaceMiddlegroundLayer
@onready var stars_foreground_layer: ParallaxLayer = $StarsForegroundLayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer



func _ready() -> void:
	audio_stream_player.play()
	
func _process(delta: float) -> void:
	space_background_layer.motion_offset.y += 2 * delta
	space_middleground_layer.motion_offset.y += 5 * delta
	stars_foreground_layer.motion_offset.y += 10 * delta
