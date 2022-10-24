extends HBoxContainer

signal add_letter_flag(letter)

export (NodePath) var _Line

onready var Line = get_node(_Line)

func _ready():
	pass

func _on_Button_pressed():
	print(Line.text)
	emit_signal("add_letter_flag", Line.text)
	Line.text = ""
	pass # Replace with function body.
