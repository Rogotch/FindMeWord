extends Control

export (NodePath) var _word_line
onready var word_line = get_node(_word_line)
export (NodePath) var _word_conditions
onready var word_conditions = get_node(_word_conditions)

func _ready():
	word_line.connect("update_word_line", self, "get_final_words")
	word_conditions.connect("update_conditions", self, "get_final_words")
	pass

func get_final_words():
	Global.get_final_array(word_line.word, word_conditions.letters_conditions)
	pass
