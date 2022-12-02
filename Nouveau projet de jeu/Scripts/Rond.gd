extends "res://Scripts/Goutte.gd"

var id

func _ready():
	position = Vector2(-11,-11)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var papa = get_parent()
	if papa != Global.Mere:
		self_modulate = papa.self_modulate
