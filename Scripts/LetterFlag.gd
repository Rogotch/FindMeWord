extends HBoxContainer

signal letter_flag_update

export (NodePath) var _Flag
onready var FlagButton = get_node(_Flag)

var text setget set_letter, get_text
var flag setget set_flag, get_flag

func _ready():
	pass

func set_letter(letter):
	FlagButton.text = letter
	text = letter
	pass

func get_text():
	return FlagButton.text.to_lower()
	pass

func update_flag(_value):
	print("update ", _value)
	flag = _value
	emit_signal("letter_flag_update")
	pass

func set_flag(value):
	flag = value
	FlagButton.pressed = value
	emit_signal("letter_flag_update")
	pass

func get_flag() -> bool:
	return FlagButton.pressed
	pass

func Delete():
#	emit_signal("letter_flag_update")
	queue_free()
	pass
