extends Control
var music_enabled = !(AudioServer.is_bus_mute(AudioServer.get_bus_index("Music")))
var is_fullscreen = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN
var settings = []
var index = 0
var time_held = 0
var requierd_hold_time = 1
 
# Called when the node enters the scene tree for the first time.
func _ready(): 
	_setUp()
	
	settings.append($Settings/MusicEnabled)
	settings.append($Settings/FullscreenEnabled)
	
	settings.append($Settings/Return)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("Iterate"):
		if index < settings.size() - 1:
			index += 1
		else:
			index = 0
		settings[index].grab_focus()
	
	if Input.is_action_pressed("Iterate"):
		time_held += delta
	else:
		time_held = 0
		_resetBars()
		
	_updateBars()
	
	if time_held > requierd_hold_time:
		_updateSetting()
		
	
	
	
func _updateBars():
	var bar_to_update
	
	if index == 0:
		bar_to_update = $Settings/MusicEnabled/MusicEnabledBar
	if index == 1:
		bar_to_update = $Settings/FullscreenEnabled/FullscreenEnabledBar
	if index == 2:
		bar_to_update = $Settings/Return/ReturnBar
	
	bar_to_update.value = time_held * 100

#more hardcoded bullshit, just ignore this and pretend like it doesnt exist
func _resetBars():
	$Settings/MusicEnabled/MusicEnabledBar.value = 0
	$Settings/FullscreenEnabled/FullscreenEnabledBar.value = 0
	$Settings/Return/ReturnBar.value = 0

func _updateSetting():
	if index == 0:
		music_enabled = !music_enabled  
		if music_enabled:
			$Settings/MusicEnabled.text = "Music: Enabled"
			AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)   
		else:
			$Settings/MusicEnabled.text = "Music: Disabled"
			AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)     
	if index == 1:
		is_fullscreen = !is_fullscreen  
		if is_fullscreen:
			$Settings/FullscreenEnabled.text = "Fullscreen: Enabled"
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		else:
			$Settings/FullscreenEnabled.text = "Fullscreen: Disabled"
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	if index == 2:
		get_tree().change_scene_to_file("res://menu.tscn") 
		
	
	
	
	time_held = 0
	
func _setUp():
	if music_enabled:
		$Settings/MusicEnabled.text = "Music: Enabled"
	else:
		$Settings/MusicEnabled.text = "Music: Disabled"
	
	if is_fullscreen:
		$Settings/FullscreenEnabled.text = "Fullscreen: Enabled"
	else:
		$Settings/FullscreenEnabled.text = "Fullscreen: Disabled"
		
