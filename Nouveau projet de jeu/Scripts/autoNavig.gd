extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Button_pressed():
	var chauffe = get_node("../Chauffe")
	var posChauffe = chauffe.position
	
	var goutte = get_node("../Goutte/Rond")
	var posGoutte = goutte.position
	
	var xChauffe = posChauffe.x
	var yChauffe = posChauffe.y
	print(xChauffe, " ", yChauffe)
	
	var xGoutte = posGoutte.x
	var yGoutte = posGoutte.y
	print(xGoutte, " ", yGoutte)
	
	var xFinalPos = xChauffe - xGoutte
	var yFinalPos = yChauffe - yGoutte
	xFinalPos = abs(xFinalPos)
	yFinalPos = abs(yFinalPos)
	
	print(xFinalPos, " ", yFinalPos )
	
	print("modulo: ", fmod(yFinalPos,9))
	
#	for i in range(0, yFinalPos/9, 1):
#		goutte.move_bas()
		
	if yGoutte<yChauffe:
		for i in range(0, yFinalPos/9, 1):
			goutte.move_bas()
			
	else:
		for i in range(0, yFinalPos/9, 1):
			goutte.move_haut()
			
	var t = Timer.new()
	t.set_wait_time(0.5)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")


	if xGoutte>xChauffe:
		for i in range(0, xFinalPos/9, 1):
			goutte.move_gauche()
	else:
		for i in range(0, xFinalPos/9, 1):
			goutte.move_droite()

