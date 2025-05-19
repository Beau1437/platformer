extends State

@onready
var fall_state: State = $"../Fall"
@onready
var walk_state: State = $"../Walk"

@export
var jump_force = 700

func enter() -> void:
	super()
	parent.velocity.y -= jump_force

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_released("jump"):
		parent.velocity.y = parent.velocity.y / 2
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += delta * gravity
	if abs(parent.velocity.x) > move_speed:
		if parent.velocity.x > 0:
			parent.velocity.x -= delta * air_resistance
		else:
			parent.velocity.x += delta * air_resistance
	if !parent.velocity.y <= 0:
		return fall_state

	if abs(parent.velocity.x) <= move_speed:
		var movement = Input.get_axis("move_left", "move_right")
		parent.velocity.x = movement * move_speed
	
	parent.move_and_slide()
	return null
