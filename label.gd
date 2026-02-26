extends Label


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	text = "Score: " + str($"../../Mario/Mini_Mario".score)
