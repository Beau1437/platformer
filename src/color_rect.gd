extends ColorRect

@onready
var label = $Label

func set_type(type: int):
	if type == 1:
		label.text = "Red Shell\n$0"
	elif type == 2:
		label.text = "Blue Shell\n$50"
	elif type == 3:
		label.text = "Green Shell\n$200"
	else:
		label.text = ""
