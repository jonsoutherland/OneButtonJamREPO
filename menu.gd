extends Control
var menu_items = [] # creates an empty array for the menu items
var index = 0 # creates index variable for above array
var time_held = 0 # records how long the space key is held down
var requierd_hold_time = 1 # set this number to change how long the user needs to hold the input


# called when the node enters the scene tree for the first time.
func _ready():
	# these append the menu button options into the menu_items array
	menu_items.append($StartMenu/StartButton)
	menu_items.append($StartMenu/OptionsButton)
	menu_items.append($StartMenu/Credits)
	menu_items.append($StartMenu/QuitButton)
	
	# sets the focus to the first item (start button)
	menu_items[0].grab_focus() # grab focus allows us to select shit with keys


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# this conditonal loops through the array of menu buttons
	if Input.is_action_just_released("Iterate"):
		if index < menu_items.size() - 1:
			index += 1
		else:
			index = 0
		menu_items[index].grab_focus()

	# this one checks if we are holding down the space bar and for how long
	if Input.is_action_pressed("Iterate"):
		time_held += delta
	else:
		time_held = 0
	if time_held > requierd_hold_time:
		_loadMenu(index)

# a function to load the selected menu item's scene
func _loadMenu(menu_index):
	if menu_index == 0:
		get_tree().change_scene_to_file("res://e.tscn")
	elif menu_index == 1:
		get_tree().change_scene_to_file("res://options.tscn")
	elif menu_index == 2:
		get_tree().change_scene_to_file("res://credits.tscn")
	elif menu_index == 3:
		get_tree().quit()



