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
				var x = get_node("coord_X")
				var y = get_node("coord_Y")
				var rgb = Color(float(get_node("R").text)/100, float(get_node("B").text)/100, float(get_node("G").text)/100)
				var pos = Vector2(int(x.text), int(y.text))
				if pos.x >= Global.longueur_grille or pos.y >= Global.hauteur_grille or pos.x < 0 or pos.y < 0:
					return
				pos.x = pos.x*9 + 5
				pos.y = pos.y*9 + 5
				#print(pos)
				Global.goutte.generate_new(pos, rgb)
				#print(int(value.text))
				#get_node("../chauffage").execute(int(value.text))
				self.visible = false
				return
			if event.pressed and event.scancode == KEY_ESCAPE:
				self.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Nouvelle_Goutte_pressed():
	self.visible = true
