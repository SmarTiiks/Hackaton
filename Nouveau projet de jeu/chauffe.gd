extends Button

var _timer = null
onready var goutte = get_node("../Rond")
var pos

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	
	

func _on_Button_pressed():
	pos = goutte.position
	goutte.position = Vector2(86, 50)
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(true) # Make sure it loops
	_timer.start()
	

func _on_Timer_timeout():
	goutte.position = pos
	
