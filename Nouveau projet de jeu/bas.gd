extends Button

var hauteur_grille = 8

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Button_pressed():
	var goutte = get_node("../Rond")
	if goutte.position.y <= 9*(hauteur_grille-1):
		goutte.translate(Vector2(0, 9))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
