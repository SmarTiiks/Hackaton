extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	#pass # Replace with function body


func _on_Button_pressed():
	Global.goutte.combine("up")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
