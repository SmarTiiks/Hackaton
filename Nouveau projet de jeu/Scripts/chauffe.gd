extends Button

var timer = null
var goutte = Global.goutte
var pos 

func _ready():
	#modulate = Color(255, 0, 0)
	timer = Timer.new()
	#add_child(timer)

	#_timer.connect("timeout", self, "_on_Timer_timeout")
	
	

func execute(time = 1):
	pos = Global.goutte.position
	var chauffe = get_node("../Chauffe")
	var posChauffe = chauffe.position
	moveto(posChauffe)
	timer.set_wait_time(time + 1.5)
	timer.set_one_shot(true)
	self.add_child(timer)
	timer.start()
	yield(timer, "timeout")
	moveto(pos)
	
	
func moveto(posChauffe):
	#var chauffe = get_node("../Chauffe")
	#var posChauffe = chauffe.position
	
	var posGoutte = Global.goutte.position
	
	var xChauffe = posChauffe.x
	var yChauffe = posChauffe.y
	#print(xChauffe, " ", yChauffe)
	
	var xGoutte = posGoutte.x
	var yGoutte = posGoutte.y
	#print(xGoutte, " ", yGoutte)
	
	var xFinalPos = xChauffe - xGoutte
	var yFinalPos = yChauffe - yGoutte
	xFinalPos = abs(xFinalPos)
	yFinalPos = abs(yFinalPos)
	var t = Timer.new()
	
	#print(xFinalPos, " ", yFinalPos )
	
	#print("modulo: ", fmod(yFinalPos,9))
	
#	for i in range(0, yFinalPos/9, 1):
#		goutte.move_bas()
		
	if yGoutte<yChauffe:
		for i in range(0, yFinalPos/9, 1):
			t.set_wait_time(0.05)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			Global.goutte.move_bas_no_fuse()
			
	else:
		for i in range(0, yFinalPos/9, 1):
			t.set_wait_time(0.05)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			Global.goutte.move_haut_no_fuse()
			
	t.set_wait_time(0.5)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")


	if xGoutte>xChauffe:
		for i in range(0, xFinalPos/9, 1):
			t.set_wait_time(0.05)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			Global.goutte.move_gauche_no_fuse()
	else:
		for i in range(0, xFinalPos/9, 1):
			t.set_wait_time(0.05)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			Global.goutte.move_droite_no_fuse()
	return


	

#func _on_Timer_timeout():
#	moveto(pos)
	
