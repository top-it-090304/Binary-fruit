extends Control

## Экран настроек

@onready var sound_checkbox: CheckBox = $Panel/VBoxContainer/SoundCheckBox
@onready var music_checkbox: CheckBox = $Panel/VBoxContainer/MusicCheckBox
@onready var back_button: Button = $Panel/VBoxContainer/BackButton

var main_menu_scene = preload("res://main_menu.tscn")

func _ready() -> void:
	var game_manager = get_node_or_null("/root/GameManager")
	if game_manager:
		sound_checkbox.button_pressed = game_manager.sound_enabled
		music_checkbox.button_pressed = game_manager.music_enabled
	
	sound_checkbox.toggled.connect(_on_sound_toggled)
	music_checkbox.toggled.connect(_on_music_toggled)
	back_button.pressed.connect(_on_back_pressed)

func _on_sound_toggled(button_pressed: bool) -> void:
	var game_manager = get_node_or_null("/root/GameManager")
	if game_manager:
		game_manager.sound_enabled = button_pressed
		game_manager.save_settings()

func _on_music_toggled(button_pressed: bool) -> void:
	var game_manager = get_node_or_null("/root/GameManager")
	if game_manager:
		game_manager.music_enabled = button_pressed
		game_manager.save_settings()

func _on_back_pressed() -> void:
	# Возвращаемся на предыдущий экран (главное меню)
	get_tree().change_scene_to_file("res://main_menu.tscn")
