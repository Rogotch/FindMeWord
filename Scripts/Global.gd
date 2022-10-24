extends Node

signal second_array_update
signal final_array_update

var all_words = []
var second_words = []
var final_words = []

var file_path = "res://source/russian_nouns.txt"

func _ready():
	read_from_file()
	pass

func read_from_file():
	var all_words_file = File.new()
	all_words_file.open(file_path, File.READ)
	var index = 1
	while not all_words_file.eof_reached(): # iterate through all lines until the end of file is reached
		var line = all_words_file.get_line()
#		line += " "
#		print(line + str(index))
		all_words.append(line)
		index += 1
	all_words_file.close()
	pass

func set_word_length(length):
	second_words = []
	for word in all_words:
		if word.length() == length:
			second_words.append(word)
	final_words = second_words
	emit_signal("second_array_update")
	pass

func get_final_array(words_letters, conditions_letters):
	var first_step_array = []
	final_words = []
#	for word in second_words:
	for word in second_words:
		var append_flag = true
		for i in words_letters.keys():
			var test_i = i
			var test_flag = word[i] == words_letters[i]
#			print(words_letters[i], " +")
			if words_letters[i] == null || words_letters[i].length() == 0:
				continue
			append_flag = append_flag && word[i] == words_letters[i]
		if append_flag:
			first_step_array.append(word)
	
	for word in first_step_array:
		var append_flag = true
		for letter in conditions_letters.keys():
			print()
			print(letter in word)
			print(((not letter in word) && conditions_letters[letter] == false))
			print((letter in word && conditions_letters[letter]))
			append_flag = (append_flag && (((not letter in word) && conditions_letters[letter] == false) 
							||  (letter in word && conditions_letters[letter])))
#			append_flag = append_flag && letter in word && conditions_letters[letter]
		if append_flag:
			final_words.append(word)
	
	emit_signal("final_array_update")
	pass
