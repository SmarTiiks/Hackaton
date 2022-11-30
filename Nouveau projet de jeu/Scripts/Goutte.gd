extends Sprite

var _timer = null
var rng = RandomNumberGenerator.new()


func _ready():
	#get_node("/root/Node2D/Camera2D/Goutte/Rond").position = Vector2(-11,-11)
	#position = Vector2(-100,-100)
	#visible = false
	#generate_new()
	#Global.goutte = get_child(1)
	#Global.goutte = get_child(0)
	#Global.Mere = self
	pass

func move_droite():
	if self.position.x <= 9*(Global.longueur_grille-1):
		if not combine("right"):
			for i in 9:
				var t = Timer.new()
				t.set_wait_time(0.01)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				self.translate(Vector2(1, 0))
		
func move_droite_no_fuse():
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
		if not combine("left"):
			for i in 9:
				var t = Timer.new()
				t.set_wait_time(0.01)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				self.translate(Vector2(-1, 0))
		
func move_gauche_no_fuse():
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
		if not combine("down"):
			for i in 9:
				var t = Timer.new()
				t.set_wait_time(0.01)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				self.translate(Vector2(0, 1))
			
func move_bas_no_fuse():
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
		if not combine("up"):
			for i in 9:
				var t = Timer.new()
				t.set_wait_time(0.01)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				self.translate(Vector2(0, -1))

func move_haut_no_fuse():
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

func generate_new():
	if get_child_count() > Global.longueur_grille * Global.hauteur_grille * 0.9:
		print("trop de gouttes")
		return
	rng.randomize()
	var rand_y = rng.randi_range(0, 9*(Global.hauteur_grille-1))
	var rand_x = rng.randi_range(0, 9*(Global.longueur_grille-1))
	var pos = Vector2(to_nine_multiple(rand_x) + 5, to_nine_multiple(rand_y) + 5)
	var Rond = get_child(0)
	var tmp
	for i in get_child_count():
		tmp = get_child(i)
		if tmp.position == pos:
			generate_new()
			return
	var child = Rond.duplicate()
	#child.name = "ron"
	add_child(child)
	child.modulate = (Color(randf(),randf(),randf(),1.0))
	child.visible = true
	child.position = pos

func combine(dir):
	var col
	for i in Global.Mere.get_children():
		if dir == "left":
			if i.global_position.x == Global.goutte.global_position.x - 9 and i.global_position.y == Global.goutte.global_position.y:
				Global.Mere.remove_child(i)
				Global.goutte.add_child(i)
				i.global_position = Global.goutte.global_position - Vector2(9, 0)
				col = i.modulate.blend(Global.goutte.modulate)
				i.modulate = col
				Global.goutte.modulate = col
				return true
		if dir == "right":
			if i.global_position.x == Global.goutte.global_position.x + 9 and i.global_position.y == Global.goutte.global_position.y:
				Global.Mere.remove_child(i)
				Global.goutte.add_child(i)
				i.global_position = Global.goutte.global_position - Vector2(-9, 0)
				col = i.modulate.blend(Global.goutte.modulate)
				i.modulate = col
				Global.goutte.modulate = col
				return true
		if dir == "up":
			if i.global_position.y == Global.goutte.global_position.y - 9 and i.global_position.x == Global.goutte.global_position.x:
				Global.Mere.remove_child(i)
				Global.goutte.add_child(i)
				i.global_position = Global.goutte.global_position - Vector2(0, 9)
				col = i.modulate.blend(Global.goutte.modulate)
				i.modulate = col
				Global.goutte.modulate = col
				return true
		if dir == "down":
			if i.global_position.y == Global.goutte.global_position.y + 9 and i.global_position.x == Global.goutte.global_position.x:
				Global.Mere.remove_child(i)
				Global.goutte.add_child(i)
				i.global_position = Global.goutte.global_position - Vector2(0, -9)
				col = i.modulate.blend(Global.goutte.modulate)
				i.modulate = col
				Global.goutte.modulate = col
				return true

func _on_New_pressed():
	generate_new()
	
