extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide() # Replace with function body.

func _input(event):
	if visible:
		if event is InputEventKey:
			if event.pressed and event.scancode == KEY_ENTER:
				var id = int(get_node("ID").text)
				if id >= Global.Mere.get_child_count() or id <= 0:
					return
				Global.goutte = Global.Mere.get_child(id)
				#print(int(value.text))
				#get_node("../chauffage").execute(int(value.text))
				self.visible = false
				return
			if event.pressed and event.scancode == KEY_ESCAPE:
				self.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Selector_pressed():
	visible = true
