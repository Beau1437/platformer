extends State

@onready
var walk_state: State = $"../Walk"
@onready
var jump_state: State = $"../Jump"

func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	var movement = Input.get_axis("move_left", "move_right") * move_speed
	parent.velocity.x = movement
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += delta * gravity
	parent.move_and_slide()
	if parent.is_on_floor():
		if Input.is_action_pressed("jump"):
			return jump_state
		return walk_state
	return null
