extends Node2D
class_name Bullet

@export
var speed: int
var damage: int

func _process(delta: float) -> void:
	if speed:
		position += transform.x * speed * delta
