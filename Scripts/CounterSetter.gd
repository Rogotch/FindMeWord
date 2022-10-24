extends SpinBox

export (NodePath) var _Fields
onready var Fields = get_node(_Fields)

func _ready():
	value = Fields.count
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SpinBox_value_changed(_value):
	Fields.count = _value
	pass # Replace with function body.
