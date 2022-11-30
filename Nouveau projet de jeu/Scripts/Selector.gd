extends Button

onready var img = get_child(0)
var index = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	img.visible = true
	posi()
	#img.global_position = Global.goutte.global_position

func posi():
	#var x = Global.goutte.position.x
	#var y = Global.goutte.position.y
	#img.position = Vector2(x - 198 - 5 , y - 5)
	img.global_position = Global.goutte.global_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	posi()


func _on_Selector_pressed():
	var maximum = Global.Mere.get_child_count()
	print (maximum)
	index = index + 1
	if index + 1 > maximum:
		index = 1
	Global.goutte = Global.Mere.get_child(index)
	posi()
	
