extends Control
var player_is_drinking = false
var enemy_is_ready = false
var intoxication = 0
var intoxication_max = 9900
var is_drunk
var menu_items = [] # creates an empty array for the menu items
var index = 0 # creates index variable for above array
var time_held = 0 # records how long the space key is held down
var requierd_hold_time = 1 # set this number to change how long the user needs to hold the input
var restart = true


# Called when the node enters the scene tree for the first time.
func _ready():
	menu_items.append($GameOverInfo/RestartButton)
	menu_items.append($GameOverInfo/ReturnButton)
	
	menu_items[0].grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_drunk:
		gameOver(delta)
	else:
		is_drunk = intoxication >= intoxication_max
		
		intoxication = $TextureProgressBar.value
		player_is_drinking = Input.is_action_pressed("Iterate")
		if player_is_drinking and enemy_is_ready:
			$TextureProgressBar.value += 2
			$Hand.set_visible(false)
			$Drink.set_visible(true)
		else:
			$TextureProgressBar.value -= 1
			$Hand.set_visible(true)
			$Drink.set_visible(false)
		

func gameOver(delta):
	$TextureProgressBar.value = intoxication_max
	$GameOverInfo.visible = true
	
	if Input.is_action_just_released("Iterate"):
			$MenuSelect.play()
			if restart:
				$GameOverInfo/RestartButton.grab_focus()
				restart = false
			else:
				$GameOverInfo/ReturnButton.grab_focus()
				restart = true
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
	
func _resetProgressBars():
	$GameOverInfo/ReturnButton/ReturnBar.value = 0
	$GameOverInfo/RestartButton/RestartBar.value = 0
	
func _progressBar(): 
	var bar_to_update
	var restart_progress_bar = $GameOverInfo/ReturnButton/ReturnBar
	var return_progress_bar = $GameOverInfo/RestartButton/RestartBar
	
	if restart:
		bar_to_update = restart_progress_bar
	else:
		bar_to_update = return_progress_bar
		
	bar_to_update.value = time_held * 100
	
func _loadMenu(menu_index):
	if !restart:
		get_tree().change_scene_to_file("res://level.tscn")
	else:
		get_tree().change_scene_to_file("res://menu.tscn")
	
	
	
	
	
