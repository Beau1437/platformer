extends Node2D

var bullet = preload("res://src/player/gun/Bullet.tscn")

@onready
var player = $".."

var can_shoot = true

var clip: Stack

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if cos(rotation) < -0.25:
		scale.y = -1
	elif cos(rotation) > 0.25:
		scale.y = 1
	if Input.is_action_just_pressed("shoot") && can_shoot:
		for n in 5:
			var bullet_instance = bullet.instantiate()
			get_tree().root.add_child(bullet_instance)
			bullet_instance.global_position = global_position
			if randf_range(1,2) > 1.5:
				bullet_instance.rotation = rotation + randf_range(0, 0.25)
			else:
				bullet_instance.rotation = rotation - randf_range(0, 0.25)
		player.velocity -= Vector2(cos(rotation) * 1200, sin(rotation) * 1200)
		cooldown(0.8)

func cooldown(time) -> void:
	can_shoot = false
	get_tree().create_timer(time).timeout.connect(
		func():
			can_shoot = true
	)
