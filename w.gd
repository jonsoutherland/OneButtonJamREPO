extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var image = Image.new()
	image.load("res://.godot/imported/e.jpg")
	var t = ImageTexture.new()
	t.create_from_image(image)
	$Sprite2D.texture = t


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
