extends Control


@export var game_stats: GameStats

@onready var score_value: Label = %ScoreValue
@onready var high_score_value: Label = %HighScoreValue

func _ready() -> void:
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
	score_value.text = str(game_stats.score)
	high_score_value.text  = str(game_stats.highscore)

func _process(delta: float) -> void:
	if Input.is_anything_pressed():
		game_stats.score = 0
		get_tree().change_scene_to_file("res://menus/menu.tscn")
