extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !(get_parent().is_drunk):
		modulate.a = 0.0001 * get_parent().intoxication
	
	
func _setBlack():
	modulate.a = 1
