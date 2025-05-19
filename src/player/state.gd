extends Node
class_name State

@export
var move_speed = 400
var air_resistance = 500
var gravity: int = 2000

var parent: Player

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
