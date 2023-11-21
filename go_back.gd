extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x  = 2
	pass



func _on_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
