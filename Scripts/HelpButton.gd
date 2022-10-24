extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Help_pressed():
	OS.shell_open("https://github.com/Rogotch/FindMeWord/blob/main/README.md")
	pass # Replace with function body.
