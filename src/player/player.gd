extends CharacterBody2D
class_name Player

@onready
var StateMachine = $StateMachine

var can_grab = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	StateMachine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	StateMachine.process_input(event)

func _physics_process(delta: float) -> void:
	StateMachine.process_physics(delta)

func _process(delta: float) -> void:
	StateMachine.process_frame(delta)

func start(pos):
	position = pos
