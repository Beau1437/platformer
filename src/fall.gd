extends State

@onready
var walk_state: State = $"../Walk"

func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("move_left"):
		parent.velocity.x = -move_speed
		parent.dir = -1
	elif Input.is_action_pressed("move_right"):
		parent.velocity.x =  move_speed
		parent.dir = 1
	else:
		parent.velocity.x = 0
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += delta * gravity
	parent.move_and_slide()
	if (parent.is_on_floor()):
		return walk_state
	return null
