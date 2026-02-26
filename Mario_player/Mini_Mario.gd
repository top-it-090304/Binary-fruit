extends CharacterBody2D


const SPEED = 125.0

const JUMP_VELOCITY = -342.0

var score = 0

var health = 1

@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump_mini")

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction > 0 and health > 0:
		$AnimatedSprite2D.flip_h = false
		velocity.x = direction * SPEED
		if velocity.y == 0: 
			anim.play("Walk_mini")
		if velocity.y < 0:
			anim.play("Jump_mini")
		if velocity.y > 0:
			anim.play("Jump_mini")
	elif direction == 0 and velocity.y == 0 and health > 0:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("Idle_mini")
	elif direction < 0 and health > 0:
		$AnimatedSprite2D.flip_h = true
		velocity.x = direction * SPEED
		if velocity.y == 0: 
			anim.play("Walk_mini")
		if velocity.y < 0:
			anim.play('Jump_mini')
		if velocity.y > 0: 
			anim.play('Fall_mini')
	elif velocity.y > 0 and health > 0: 
		anim.play("Fall_mini")
	elif health <= 0: 
		var tween1 = get_tree().create_tween()
		tween1.tween_property(self, "position", position - Vector2(0, 5), 0.3)
		velocity.x = 0
		anim.play("Death_mini")
		await anim.animation_finished
		get_tree().change_scene_to_file.bind("res://menu.tscn").call_deferred()
		tween1.tween_callback(queue_free)
	

	move_and_slide()
