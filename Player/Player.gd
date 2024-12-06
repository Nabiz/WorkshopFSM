extends CharacterBody2D
class_name Player

@onready var animation: AnimatedSprite2D = $AnimatedSprite
@onready var _label: Label = $Label

var _is_flipped: bool = false
func flip_horizontally(value: bool) -> void:
	if value != _is_flipped:
		_is_flipped = value
		animation.flip_h = value
		animation.position.x = -10 if _is_flipped else 10

func change_label_text(text: String) -> void:
	_label.text = text
