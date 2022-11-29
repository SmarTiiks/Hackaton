extends MenuButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var menu = get_popup()
	var submenu = PopupMenu.new()
	submenu.set_name("submenu")
	submenu.add_radio_check_item("Sub-submenu item a")
	menu.add_child(submenu)
	menu.add_submenu_item("Durée", "submenu")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
