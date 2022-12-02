extends Button

onready var img = get_child(0)
var index = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	img.visible = true
	posi()

func posi():
	img.global_position = Global.goutte.global_position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	posi()

func _on_Selector_pressed():
	get_node("/root/Camera2D/MoveTo").visible = false
	get_node("/root/Camera2D/SpawnTo").visible = false
	get_node("/root/Camera2D/Chauffe_txt").visible = false
