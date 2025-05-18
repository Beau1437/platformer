extends State

@onready
var walk_state: State = $"../Walk"
@onready
var jump_state: State = $"../Jump"

func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	if abs(parent.velocity.x) <= move_speed:
		var movement = Input.get_axis("move_left", "move_right")
		parent.velocity.x = movement * move_speed
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += delta * gravity
	if abs(parent.velocity.x) > move_speed:
		if parent.velocity.x > 0:
			parent.velocity.x -= delta * air_resistance
		else:
			parent.velocity.x += delta * air_resistance
	parent.move_and_slide()
	if parent.is_on_floor():
		if Input.is_action_pressed("jump"):
			return jump_state
		return walk_state
	return null
