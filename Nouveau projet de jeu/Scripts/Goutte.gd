extends Sprite

var _timer = null

func _ready():
	pass

func move_droite():
	if self.position.x <= 9*(Global.longueur_grille-1):
		for i in 9:
			var t = Timer.new()
			t.set_wait_time(0.01)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			self.translate(Vector2(1, 0))
			
func move_gauche():
	if self.position.x >= 9:
		for i in 9:
			var t = Timer.new()
			t.set_wait_time(0.01)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			self.translate(Vector2(-1, 0))
			
func move_bas():
	if self.position.y <= 9*(Global.hauteur_grille-1):
		for i in 9:
			var t = Timer.new()
			t.set_wait_time(0.01)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			self.translate(Vector2(0, 1))
			
func move_haut():
	if self.position.y >= 9:
		for i in 9:
			var t = Timer.new()
			t.set_wait_time(0.01)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			self.translate(Vector2(0, -1))


func _on_New_pressed():
	var Rond = get_child(0)
	var child = Rond.duplicate()
	child.name = "ron"
	add_child(child)
	child.translate(Vector2(5, 15))
	
