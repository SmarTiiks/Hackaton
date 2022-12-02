extends Button

var timer = null
var goutte = Global.goutte
var pos 

func _ready():
	timer = Timer.new()
	
func _on_Button_pressed():
	get_node("/root/Camera2D/MoveTo").visible = false
	get_node("/root/Camera2D/SpawnTo").visible = false
	get_node("/root/Camera2D/Selector_txt").visible = false

func execute(time = 1):
	pos = Global.goutte.position
	var chauffe = get_node("../Chauffe")
	var posChauffe = chauffe.position
	
	yield(Global.goutte.moveto(posChauffe), "completed")
	timer.set_wait_time(time)
	timer.set_one_shot(true)
	self.add_child(timer)
	timer.start()
	yield(timer, "timeout")
	var col = Global.goutte.self_modulate
	var red = (col.g + col.b)/2
	var ncol = Color((col.r+red)/2, col.g/2,col.b/2)
	Global.goutte.self_modulate = ncol
	Global.goutte.moveto(pos)
