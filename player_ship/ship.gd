extends Node2D

@onready var position_clamp_component: PositionClampComponent = $PositionClampComponent
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var front_cannon: Marker2D = $FrontCannon
@onready var firerate_timer: Timer = $FirerateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $Anchor/AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	firerate_timer.timeout.connect(_shoot_laser)
	
func _shoot_laser() -> void:
	audio_stream_player.play()
	spawner_component.spawn(front_cannon.global_position)
	scale_component.tween_scale()


func _process(delta: float) -> void:
	animate_the_ship()

func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("turn_left")
	elif move_component.velocity.x > 0:
		animated_sprite_2d.play("turn_right")
	else:
		animated_sprite_2d.play("main")
