extends Control
var time_held = 0
var required_hold_time = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$ReturnBox/Button.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Iterate"):
		time_held += delta
	else:
		time_held = 0
		
	$ReturnBox/Button/ButtonHeld.value = time_held * 100

	if time_held > required_hold_time:
		get_tree().change_scene_to_file("res://menu.tscn")

	
