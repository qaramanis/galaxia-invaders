extends Node2D

@export var KalamarisEnemyScene: PackedScene
@export var KavourisEnemyScene: PackedScene
@export var KeravnosEnemyScene: PackedScene
@export var PrasinosMagkasEnemyScene: PackedScene

@export var game_stats: GameStats

var margin = 8
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var kalamaris_enemy_spawner_timer: Timer = $KalamarisEnemySpawnerTimer
@onready var kavouris_enemy_spawner_timer: Timer = $KavourisEnemySpawnerTimer
@onready var keravnos_enemy_spawner_timer: Timer = $KeravnosEnemySpawnerTimer
@onready var prasinos_magkas_spawner_timer: Timer = $PrasinosMagkasSpawnerTimer


func _ready() -> void:
	kalamaris_enemy_spawner_timer.timeout.connect(handle_spawn.bind(KalamarisEnemyScene, kalamaris_enemy_spawner_timer))
	kavouris_enemy_spawner_timer.timeout.connect(handle_spawn.bind(KavourisEnemyScene, kavouris_enemy_spawner_timer, 15.0))
	keravnos_enemy_spawner_timer.timeout.connect(handle_spawn.bind(KeravnosEnemyScene, keravnos_enemy_spawner_timer, 6.0))
	prasinos_magkas_spawner_timer.timeout.connect(handle_spawn.bind(PrasinosMagkasEnemyScene, prasinos_magkas_spawner_timer, 30))
	
	game_stats.score_changed.connect(func(new_score: int):
		if new_score > 75:
			kavouris_enemy_spawner_timer.process_mode = Node.PROCESS_MODE_INHERIT
		
		if new_score > 150:
			prasinos_magkas_spawner_timer.process_mode = Node.PROCESS_MODE_INHERIT
	)
	
func handle_spawn(enemy_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width-margin), -8))
	var spawn_rate = time_offset / (0.5 + (game_stats.score * 0.015))
	timer.start(spawn_rate + randf_range(0.25, 05))
