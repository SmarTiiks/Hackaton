extends "res://Scripts/Goutte.gd"

var id
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(-11,-11)
	#Global.goutte = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var papa = get_parent()
	if papa != Global.Mere:
		self_modulate = papa.self_modulate
#	pass
