extends Node
class_name State

var player: Player

signal change_state(target_state: State)

func handle_input(_event: InputEvent) -> void:
	pass

func enter() -> void:
	pass
	
func exit() -> void:
	pass

func process(_delta: float) -> void:
	pass

func physics_process(_delta: float) -> void:
	pass
