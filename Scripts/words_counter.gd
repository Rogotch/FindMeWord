extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("final_array_update", self, "set_count")
	yield(get_tree(), "idle_frame")
	set_count()
	pass

func set_count():
	text = "Количество совпадений: " + str(Global.final_words.size())
	pass
