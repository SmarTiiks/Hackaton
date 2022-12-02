extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	#pass # Replace with function body

func _on_Button_pressed():
	Global.goutte.combine("right")

	
	#if goutte.position.x <= 9*(longueur_grille-1):
	#	for i in 9:
	#		var t = Timer.new()
	#		t.set_wait_time(0.01)
	#		t.set_one_shot(true)
	#		self.add_child(t)
	#		t.start()
	#		yield(t, "timeout")
	#		goutte.translate(Vector2(1, 0))
			

