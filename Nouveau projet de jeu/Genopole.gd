extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var t = Timer.new()
	t.set_wait_time(2)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	#self.visible = false
	for i in 100:
		t.set_wait_time(0.01)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		var col = self.modulate
		self.modulate = Color(col.r,col.g,col.b,col.a-0.01)
	self.visible = false
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
