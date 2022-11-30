extends Sprite

var _timer = null
var rng = RandomNumberGenerator.new()


func _ready():
	#Global.goutte = get_child(0)
	#Global.Mere = self
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

func to_nine_multiple(i):
	for j in 1000:
		if j > 0:
			if abs(i -(j * 9)) < 9:
				return j * 9
	return 0 


func _on_New_pressed():
	rng.randomize()
	var rand_y = rng.randi_range(0, 9*(Global.hauteur_grille-1))
	var rand_x = rng.randi_range(0, 9*(Global.longueur_grille-1))
	var pos = Vector2(to_nine_multiple(rand_x) + 5, to_nine_multiple(rand_y) + 5)
	var Rond = get_child(0)
	var tmp
	for i in get_child_count():
		tmp = get_child(i)
		if tmp.position == pos:
			return
		
	var child = Rond.duplicate()
	#child.name = "ron"
	add_child(child)
	child.modulate = (Color(randf(),randf(),randf(),1.0))
	child.position = pos
	
