extends Button

onready var img = get_child(0)
var index = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	img.visible = true
	img.position = Vector2(-198,0)

func posi():
	var x = Global.goutte.position.x
	var y = Global.goutte.position.y
	img.position = Vector2(x - 198 - 5 , y - 5)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	posi()


func _on_Selector_pressed():
	var maximum = Global.Mere.get_child_count()
	print (maximum)
	index = index + 1
	if index + 1 > maximum:
		index = 0
	Global.goutte = Global.Mere.get_child(index)
	posi()
	
