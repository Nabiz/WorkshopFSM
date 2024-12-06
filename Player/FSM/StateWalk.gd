extends State
class_name StateWalk

const WALK_SPEED: float = 300

static var instance: State

func _enter_tree() -> void:
	instance = self

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select"):
		emit_signal("change_state", StateJump.instance)

func enter() -> void:
	player.animation.play("Walk")
	
func exit() -> void:
	pass

func process(_delta: float) -> void:
	if !player.is_on_floor():
		emit_signal("change_state", StateFall.instance)

func physics_process(_delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * WALK_SPEED
		if direction < 0:
			player.flip_horizontally(true)
		elif direction > 0:
			player.flip_horizontally(false)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, WALK_SPEED)
		emit_signal("change_state", StateIdle.instance)
	player.move_and_slide()
