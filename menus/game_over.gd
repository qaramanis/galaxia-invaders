extends Control

const SAVE_PATH =  "user://save.cfg"

@export var game_stats: GameStats

var save_path = SAVE_PATH

@onready var score_value: Label = %ScoreValue
@onready var high_score_value: Label = %HighScoreValue

func _ready() -> void:
	load_highscore()
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
		save_highscore()
	score_value.text = str(game_stats.score)
	high_score_value.text  = str(game_stats.highscore)

func _process(delta: float) -> void:
	if Input.is_anything_pressed():
		game_stats.score = 0
		TransitionScreen.transition()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://menus/menu.tscn")

func load_highscore() -> void:
	var config = ConfigFile.new()
	var error = config.load(save_path)
	if error != OK: return
	game_stats.highscore = config.get_value("game", "highscore")
	
func save_highscore() -> void:
	var config = ConfigFile.new()
	config.set_value("game", "highscore", game_stats.highscore)
	config.save(save_path)
