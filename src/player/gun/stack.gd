extends Node
class_name Stack

var stack: Array

func push(data) -> void:
	stack.push_front(data)

func pop():
	return stack.pop_front()

func size() -> int:
	return stack.size()
