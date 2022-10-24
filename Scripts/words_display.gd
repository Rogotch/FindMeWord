extends ScrollContainer

export (NodePath) var _words_box
onready var words_box = get_node(_words_box)

export (NodePath) var _words_count
onready var words_count = get_node(_words_count)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("final_array_update", self, "show_words")
	yield(get_tree(), "idle_frame")
	show_words()
	pass # Replace with function body.

func show_words():
	var box_children = words_box.get_children()
	for word in box_children:
		word.queue_free()
	
	var max_words = int(words_count.value)
	for word in Global.final_words:
#		print(word)
		var new_word = Label.new()
		words_box.add_child(new_word)
		new_word.text = word
		new_word.rect_min_size = Vector2(0, 30)
		max_words -= 1
		if max_words == 0:
			break
	
	pass


func _on_SpinBox_value_changed(_value):
	show_words()
	pass # Replace with function body.
