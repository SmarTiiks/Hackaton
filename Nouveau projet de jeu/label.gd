extends RichTextLabel

onready var maman = get_parent().get_parent()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(0,0,0)


func get_id():
	var count = 0
	for i in maman.get_children():
		if i == get_parent():
			return count
		count += 1
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
	#self.position = maman.position
		self.text =  String (get_id())
