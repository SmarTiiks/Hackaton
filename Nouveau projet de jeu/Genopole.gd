extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = true
	var t = Timer.new()
	t.set_wait_time(2)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	for i in 100:
		t.set_wait_time(0.01)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		var col = self.modulate
		self.modulate = Color(col.r,col.g,col.b,col.a-0.01)
	self.visible = false
