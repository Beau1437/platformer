extends State

@onready
var fall_state: State = $"../Fall"
@onready
var jump_state: State = $"../Jump"

func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("move_left"):
		parent.velocity.x = -move_speed
	elif Input.is_action_pressed("move_right"):
		parent.velocity.x =  move_speed
	else:
		parent.velocity.x = 0
	if Input.is_action_pressed("jump"):
		return jump_state
	return null

func process_physics(delta: float) -> State:
	if (!parent.is_on_floor()):
		return fall_state
	parent.move_and_slide()
	return null
