extends Sprite

var _timer = null
var rng = RandomNumberGenerator.new()


func _ready():
	rng.randomize()

func move_droite():
	if self.position.x <= 9*(Global.longueur_grille-1):
		self.combine("right")
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
		self.combine("left")
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
		self.combine("down")
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
		self.combine("up")
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

func generate_new(pos, rgb):
	var Rond = Global.Mere.get_child(0)
	var tmp
	for i in Global.Mere.get_child_count():
		tmp = Global.Mere.get_child(i)
		if tmp.global_position == pos:
			return
	var child = Rond.duplicate()
	Global.Mere.add_child(child)
	child.self_modulate = (rgb)
	child.visible = true
	child.global_position = pos

func atach(i):
	i.get_child(0).visible = false
	Global.Mere.remove_child(i)
	Global.goutte.add_child(i)
	
func merg(node):
	var col = Global.goutte.self_modulate
	var bis = node.self_modulate
	Global.goutte.self_modulate = Color((col.r + bis.r)/2, (col.g + bis.g)/2,(col.b + bis.b)/2)

func combine(dir):
	var col = Global.goutte.self_modulate
	for i in Global.Mere.get_children():
		if dir == "left":
			if i.global_position.x == Global.goutte.global_position.x - 9 and i.global_position.y == Global.goutte.global_position.y:
				atach(i)
				i.global_position = Global.goutte.global_position - Vector2(9, 0)
				merg(i)
				return true
		if dir == "right":
			if i.global_position.x == Global.goutte.global_position.x + 9 and i.global_position.y == Global.goutte.global_position.y:
				atach(i)
				i.global_position = Global.goutte.global_position - Vector2(-9, 0)
				merg(i)
				return true
		if dir == "up":
			if i.global_position.y == Global.goutte.global_position.y - 9 and i.global_position.x == Global.goutte.global_position.x:
				atach(i)
				i.global_position = Global.goutte.global_position - Vector2(0, 9)
				merg(i)
				return true
		if dir == "down":
			if i.global_position.y == Global.goutte.global_position.y + 9 and i.global_position.x == Global.goutte.global_position.x:
				atach(i)
				i.global_position = Global.goutte.global_position - Vector2(0, -9)
				merg(i)
				return true

func moveto(posChauffe):
		var posGoutte = Global.goutte.position
		
		var xChauffe = posChauffe.x
		var yChauffe = posChauffe.y
		var xGoutte = posGoutte.x
		var yGoutte = posGoutte.y
		var xFinalPos = xChauffe - xGoutte
		var yFinalPos = yChauffe - yGoutte
		xFinalPos = abs(xFinalPos)
		yFinalPos = abs(yFinalPos)
		var t = Timer.new()
		for i in Global.Mere.get_children():
				if i.global_position == posChauffe:
					return
			
		if yGoutte<yChauffe:
			for i in range(0, yFinalPos/9, 1):
				t.set_wait_time(0.15)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				Global.goutte.move_bas()
				
		else:
			for i in range(0, yFinalPos/9, 1):
				t.set_wait_time(0.15)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				Global.goutte.move_haut()
				
		t.set_wait_time(0.7)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")


		if xGoutte>xChauffe:
			for i in range(0, xFinalPos/9, 1):
				t.set_wait_time(0.15)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				Global.goutte.move_gauche()
		else:
			for i in range(0, xFinalPos/9, 1):
				t.set_wait_time(0.15)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				Global.goutte.move_droite()
		emit_signal("completed")
