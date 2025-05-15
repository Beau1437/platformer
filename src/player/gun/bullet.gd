extends Node2D

var speed: int = 3000

func _process(delta: float) -> void:
	position += transform.x * speed * delta
