extends Node2D

var bullet = preload("res://src/player/gun/Bullet.tscn")

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		for n in 5:
			var bullet_instance = bullet.instantiate()
			get_tree().root.add_child(bullet_instance)
			bullet_instance.global_position = global_position
			if randf_range(1,2) > 1.5:
				bullet_instance.rotation = rotation + randf_range(0, 0.25)
			else:
				bullet_instance.rotation = rotation - randf_range(0, 0.25)
