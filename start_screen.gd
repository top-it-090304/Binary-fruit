extends Control

@onready var timer: Timer = $Timer

var main_menu_scene = preload("res://main_menu.tscn")

func _ready() -> void:
	timer.wait_time = 2.5
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(main_menu_scene)
