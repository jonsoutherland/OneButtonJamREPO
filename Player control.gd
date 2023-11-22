extends Control
var is_drunk
var player_is_drinking = false
var enemy_is_ready = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_is_drinking = Input.is_action_pressed("Iterate")
	if player_is_drinking and enemy_is_ready:
		$Hand.set_visible(false)
		$Drink.set_visible(true)
	else:
		$Hand.set_visible(true)
		$Drink.set_visible(false)
		
