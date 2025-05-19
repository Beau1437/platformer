extends Control

var damage

func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property($Label, "modulate:a", 0, 1)
	tween.tween_callback(self.queue_free)

func _process(_delta: float) -> void:
	if damage:
		$Label.text = str("+$", damage)
