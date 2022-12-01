extends Node

var hauteur_grille = 8
var longueur_grille = 12
var goutte
var Mere

func _ready():
	Mere = get_node("/root/Camera2D/Goutte")
	#print(Mere.get_child_count())
	goutte = get_node("/root/Camera2D/Goutte/Rond")
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
