extends CharacterBody2D
class_name Player

@onready
var StateMachine = $StateMachine

var can_grab = true

func _ready() -> void:
	StateMachine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	StateMachine.process_input(event)

func _physics_process(delta: float) -> void:
	StateMachine.process_physics(delta)

func _process(delta: float) -> void:
	StateMachine.process_frame(delta)
