extends State
class_name StateIdle

static var instance: State

func _enter_tree() -> void:
	instance = self

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select"):
		emit_signal("change_state", StateJump.instance)

func enter() -> void:
	player.velocity = Vector2.ZERO
	player.animation.play("Idle")

func exit() -> void:
	pass

func process(_delta: float) -> void:
	if Input.get_axis("ui_left", "ui_right"):
		emit_signal("change_state", StateWalk.instance)
	elif !player.is_on_floor():
		emit_signal("change_state", StateFall.instance)

func physics_process(_delta: float) -> void:
	pass
