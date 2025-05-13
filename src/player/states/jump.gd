extends State

@onready
var fall_state: State = $"../Fall"
@onready
var walk_state: State = $"../Walk"

func enter() -> void:
	super()
	parent.velocity.y -= 500

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("move_left"):
		parent.velocity.x = -move_speed
	elif Input.is_action_pressed("move_right"):
		parent.velocity.x =  move_speed
	else:
		parent.velocity.x = 0
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += delta * gravity
	if (!parent.velocity.y < 0):
		return fall_state
	parent.move_and_slide()
	return null
