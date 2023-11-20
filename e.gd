extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var image = Image.new()
	image.load("image path")
	var t = ImageTexture.new()
	t.create_from_image(image)
	$Sprite.texture = t


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#res://e.gd
