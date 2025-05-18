extends Node2D
class_name Bullet

@export
var speed: int
var damage: int

func _process(delta: float) -> void:
	if speed:
		position += transform.x * speed * delta
		if abs(position.x) > 10000 || abs(position.y) > 10000:
			self.queue_free()
