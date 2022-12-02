extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.goutte.generate_new(Vector2(5,5), Color(150,0,0,1))
	Global.goutte = Global.Mere.get_child(1)
	pass

func _on_Nouvelle_Goutte_pressed():
	get_node("/root/Camera2D/MoveTo").visible = false
	get_node("/root/Camera2D/Chauffe_txt").visible = false
	get_node("/root/Camera2D/Selector_txt").visible = false
