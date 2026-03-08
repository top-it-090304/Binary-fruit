extends Control

## Главное меню. Нажатия обрабатываем по зонам поверх готового арт-меню.

@onready var play_area: Button = $PlayArea
@onready var settings_area: Button = $SettingsArea
@onready var exit_area: Button = $ExitArea

var game_scene = preload("res://game.tscn")
var settings_scene = preload("res://settings.tscn")

func _ready() -> void:
	play_area.pressed.connect(_on_play_pressed)
	settings_area.pressed.connect(_on_settings_pressed)
	exit_area.pressed.connect(_on_exit_pressed)

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_packed(settings_scene)

func _on_exit_pressed() -> void:
	get_tree().quit()
