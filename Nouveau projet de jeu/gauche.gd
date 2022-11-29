extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Button_pressed():
	var goutte = get_node("../Rond")
	if goutte.position.x >= 9:
		goutte.translate(Vector2(-9, 0))

