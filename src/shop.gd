extends Control

@onready
var rect = $ColorRect
@onready
var balance_counter = $Balance
var type
var on_shell = false

func _on_texture_rect_mouse_entered(type: int) -> void:
	self.type = type
	on_shell = true
	rect.set_type(type)
	rect.show()

signal purchase(t)
	
func _process(delta: float) -> void:
	if on_shell && Input.is_action_just_pressed("purchase"):
			purchase.emit(type)
	rect.position.y = get_local_mouse_position().y - 20
	
func _on_texture_rect_mouse_exited() -> void:
	on_shell = false
	rect.hide()

func set_balance(balance: int):
	balance_counter.text = str("$", balance)
