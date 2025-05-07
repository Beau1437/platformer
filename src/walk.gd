extends State

func enter() -> void:
	super()
	process_input(null)

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
	if (parent.velocity.x > 0):
		parent.dir = 1
	else:
		parent.dir = -1
	parent.move_and_slide()
	return null
