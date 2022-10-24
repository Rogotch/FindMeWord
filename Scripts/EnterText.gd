extends HBoxContainer

signal update_word_line

export var count = 5 setget set_count
var word = {}

func _ready():
	set_count(count)
	Global.set_word_length(count)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func get_text():
	var all_fields = get_children()
	var counter = 0
#	word = {}
	for field in all_fields:
		word[counter] = field.text.to_lower()
		counter += 1
	pass

func print_word():
	var final_word = ""
	for i in count:
		final_word += word[i] if word.keys().has(i) && word[i] != "" else "*"
	print(final_word)
#	print(final_word.length())
#	print(final_word[2])
	pass

func _on_LineEdit_text_changed(new_text):
	prints("text_changed", new_text)
	pass # Replace with function body.

func set_count(value):
	if get_child_count() != count:
		count = get_child_count()
	if value > count:
		for i in value-count:
#			print_word
			add_field()
	if value < count:
#		var all_fields = get_children()
		for i in count:
			if i >= value:
#				print(i)
				word.erase(i)
				get_child(i).queue_free()
	count = value
	Global.set_word_length(value)
	emit_signal("update_word_line")
	pass
#"res://source/russian_nouns.txt"
func change_letter(_value):
	get_text()
	emit_signal("update_word_line")
#	print_word()
	pass

func add_field():
	var new_field = LineEdit.new()
	add_child(new_field)
#	new_field.text = str(get_child_count())
	new_field.align = LineEdit.ALIGN_CENTER
	new_field.max_length = 1
	new_field.size_flags_horizontal = 3
	new_field.size_flags_vertical = 3
	new_field.connect("text_changed", self, "change_letter")
	pass
