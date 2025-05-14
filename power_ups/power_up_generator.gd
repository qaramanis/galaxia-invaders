extends Node2D


@export var UpgradeLaserScene: PackedScene
@export var NukeWorldScene: PackedScene

@export var game_stats: GameStats

@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var upgrade_laser_timer: Timer = $UpgradeLaserTimer
@onready var nuke_world_timer: Timer = $NukeWorldTimer


var margin = 24
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")

func _ready() -> void:
	upgrade_laser_timer.timeout.connect(handle_spawn.bind(UpgradeLaserScene, upgrade_laser_timer))
	nuke_world_timer.timeout.connect(handle_spawn.bind(NukeWorldScene, nuke_world_timer))


func handle_spawn(powerup_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:
	spawner_component.scene = powerup_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width-margin), 0))
	var spawn_rate = time_offset / (0.5 + (game_stats.score * 0.01))
	timer.start()
