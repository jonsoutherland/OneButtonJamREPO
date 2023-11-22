extends Node2D
var enemyHealth = 1200;
var final_spot = Vector2(600, 300)
var enemy_speed = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(0, 300)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x < final_spot.x:
		position.x += delta * enemy_speed
	else:
		get_parent().enemy_is_ready = true;
	pass
	
