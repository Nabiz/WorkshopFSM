extends Node
class_name PlayerStateMachine

@export var player: Player
@export var current_state: State

func _ready() -> void:
	for state: State in get_children():
		state.player = player

func _unhandled_input(event: InputEvent) -> void:
	current_state.handle_input(event)

func _process(delta: float) -> void:
	current_state.process(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_process(delta)
