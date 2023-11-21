extends Control
var menu_items = [] # creates an empty array for the menu items
var index = 0 # creates index variable for above array
var time_held = 0 # records how long the space key is held down
var requierd_hold_time = 1 # set this number to change how long the user needs to hold the input
 
# called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_music()
	# opens the game in full screen 
	# these append the menu button options into the menu_items array
	menu_items.append($StartMenu/StartButton)
	menu_items.append($StartMenu/OptionsButton)
	menu_items.append($StartMenu/Credits)
	menu_items.append($StartMenu/QuitButton)
	
	
	# sets the focus to the first item (start button   )
	menu_items[0].grab_focus() # grab focus allows us to select shit with keys


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# this conditonal loops through the array of menu buttons
	if Input.is_action_just_released("Iterate"):
		$MenuSelect.play() # plays a little sound when you iterate through the menu
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
		_resetProgressBars()
	
	_progressBar()
	
	# if the spacebar was held down for the required hold time, then load the selected button
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
		

# theres a better way to do this but i cant be fucked
func _progressBar(): 
	var bar_to_update
	var start_progress_bar = $StartMenu/StartButton/StartPressedBar
	var options_progress_bar = $StartMenu/OptionsButton/OptionsPressedBar
	var credits_progress_bar = $StartMenu/Credits/CreditsPressedBar
	var quit_progress_bar = $StartMenu/QuitButton/QuitPressedBar
	
	if index == 0:
		bar_to_update = start_progress_bar
	elif index == 1:
		bar_to_update = options_progress_bar
		
	elif index == 2:
		bar_to_update = credits_progress_bar
	elif index == 3:
		bar_to_update = quit_progress_bar
		
	bar_to_update.value = time_held * 100

# i have to do this bullshit i cannot figure out how to not do it
func _resetProgressBars():
	$StartMenu/StartButton/StartPressedBar.value = 0
	$StartMenu/OptionsButton/OptionsPressedBar.value = 0
	$StartMenu/Credits/CreditsPressedBar.value = 0
	$StartMenu/QuitButton/QuitPressedBar.value = 0


