extends State
class_name StateIdle

static var instance: State

func _enter_tree() -> void:
	instance = self

func handle_input(_event: InputEvent) -> void:
	pass

func enter() -> void:
	player.velocity = Vector2.ZERO
	player.animation.play("Idle")

func exit() -> void:
	pass

func process(_delta: float) -> void:
	if Input.get_axis("ui_left", "ui_right"):
		emit_signal("change_state", StateWalk.instance)

func physics_process(_delta: float) -> void:
	pass
