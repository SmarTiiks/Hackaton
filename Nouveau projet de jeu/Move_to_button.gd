extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _on_Move_to_pressed():
	get_node("/root/Camera2D/Selector_txt").visible = false
	get_node("/root/Camera2D/SpawnTo").visible = false
	get_node("/root/Camera2D/Chauffe_txt").visible = false
