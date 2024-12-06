extends State
class_name StateWalk

const WALK_SPEED: float = 300

static var instance: State

func _enter_tree() -> void:
	instance = self

func handle_input(_event: InputEvent) -> void:
	pass

func enter() -> void:
	player.animation.play("Walk")
	
func exit() -> void:
	pass

func process(_delta: float) -> void:
	pass

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
