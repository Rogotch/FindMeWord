extends GridContainer

signal update_conditions

export (NodePath) var _Letter_add_node
onready var Letter_add_node = get_node(_Letter_add_node)
onready var letter_flag_class = preload("res://Entities/LetterFlag.tscn")

var letters_conditions = {}

func _ready():
	Letter_add_node.connect("add_letter_flag", self, "add_letter")
	pass # Replace with function body.

func add_letter(letter):
	var new_flag = letter_flag_class.instance()
	add_child(new_flag)
	new_flag.text = (letter)
	new_flag.connect("letter_flag_update", self, "get_conditions")
	letters_conditions[letter] = false
	emit_signal("update_conditions")
	pass

func get_conditions():
	var all_conditions = get_children()
	letters_conditions = {}
	for FlagNode in all_conditions:
		letters_conditions[FlagNode.text] = FlagNode.flag
	emit_signal("update_conditions")
	pass

#func update_condition():
#	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
