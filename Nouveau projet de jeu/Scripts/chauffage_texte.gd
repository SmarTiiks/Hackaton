extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _on_Button_pressed():
	self.visible = true

func _input(event):
	if visible:
		if event is InputEventKey:
			if event.pressed and event.scancode == KEY_ENTER:
				var value = get_node("LineEdit")
				get_node("../chauffage").execute(int(value.text))
				self.visible = false
				return
			if event.pressed and event.scancode == KEY_ESCAPE:
				self.visible = false
