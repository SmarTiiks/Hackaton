extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _input(event):
	if visible:
		if event is InputEventKey:
			if event.pressed and event.scancode == KEY_ENTER:
				var id = int(get_node("ID").text)
				if id >= Global.Mere.get_child_count() or id <= 0:
					return
				Global.goutte = Global.Mere.get_child(id)
				self.visible = false
				return
			if event.pressed and event.scancode == KEY_ESCAPE:
				self.visible = false

func _on_Selector_pressed():
	visible = true
