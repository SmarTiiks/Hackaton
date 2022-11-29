extends Sprite


var _timer = null


func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()


#func _on_Timer_timeout():
#	self.translate(Vector2(9, 0))

func _process(delta):
	pass
	#self.translate(Vector2(5, 5))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
