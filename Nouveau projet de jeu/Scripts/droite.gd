extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true

func _on_Button_pressed():
	Global.goutte.combine("right")
