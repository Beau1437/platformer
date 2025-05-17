extends CharacterBody2D
class_name Player

@onready
var StateMachine = $StateMachine
@onready
var gun = $Gun

var balance = 0

var DeathScreen = preload("res://src/DeathScreen.tscn")

func _ready() -> void:
	StateMachine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	StateMachine.process_input(event)

func _physics_process(delta: float) -> void:
	StateMachine.process_physics(delta)

func _process(delta: float) -> void:
	StateMachine.process_frame(delta)

func die():
	get_tree().change_scene_to_packed(DeathScreen)

func _on_death_zone_body_entered(body: Node2D) -> void:
	die()

func _on_shop_mouse_entered() -> void:
	gun.in_shop = true

func _on_shop_mouse_exited() -> void:
	gun.in_shop = false

func _on_shop_purchase(type) -> void:
	if buy(type) && gun.clip_size() < 8:
		gun.add_shell(type)
	
func buy(type: int) -> bool:
	if type == 1:
		return true
	elif type == 2 && balance >= 10:
		balance -= 10
		return true
	elif type == 3 && balance >= 50:
		balance -= 50
		return true
	return false
