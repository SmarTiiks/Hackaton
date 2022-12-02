extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _input(event):
	if visible:
		if event is InputEventKey:
			if event.pressed and event.scancode == KEY_ENTER:
				var x = get_node("coord_X")
				var y = get_node("coord_Y")
				var pos = Vector2(int(x.text), int(y.text))
				if pos.x >= Global.longueur_grille or pos.y >= Global.hauteur_grille or pos.x < 0 or pos.y < 0:
					return
				pos.x = pos.x*9 +5
				pos.y = pos.y*9 +5
				Global.goutte.moveto(pos)
				self.visible = false
				return
			if event.pressed and event.scancode == KEY_ESCAPE:
				self.visible = false

func _on_Move_to_pressed():
	self.visible = true
