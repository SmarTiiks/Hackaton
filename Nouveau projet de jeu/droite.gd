extends Button

var longueur_grille = 12

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Button_pressed():
	var goutte = get_node("../Rond")
	if goutte.position.x <= 9*(longueur_grille-1):
		goutte.translate(Vector2(9, 0))

