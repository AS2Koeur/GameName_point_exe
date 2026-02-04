extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_YNButton_Pressed)
	if Dialogic.current_timeline != null:
		return
	await get_tree().create_timer(2.0)
	print("startDialogue")
	Dialogic.start("res://dialogTimeline/timeline.dtl")
	get_viewport().set_input_as_handled()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_YNButton_Pressed(argument : String):
	#await get_tree().create_timer(4.0)
	if argument == "Oui":
		#await get_tree().create_timer(4.0)
		get_tree().change_scene_to_file("res://scenes/Scene2Chambre.tscn")
	elif argument == "Non":
		#await get_tree().create_timer(4.0)
		get_tree().quit()
