extends Button

var longueur_grille = 12

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Button_pressed():
	var goutte = get_node("../Rond")
	goutte.move_droite()

	
	#if goutte.position.x <= 9*(longueur_grille-1):
	#	for i in 9:
	#		var t = Timer.new()
	#		t.set_wait_time(0.01)
	#		t.set_one_shot(true)
	#		self.add_child(t)
	#		t.start()
	#		yield(t, "timeout")
	#		goutte.translate(Vector2(1, 0))
			

