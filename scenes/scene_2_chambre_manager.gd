extends Control



#var DialogueIndex = 0
func _ready() -> void:
	
	await get_tree().create_timer(2.0).timeout
	$BegininTimer.start()
	await $AudioStreamPlayer2D.finished
	if Dialogic.current_timeline != null:
		return
	await get_tree().create_timer(2.0)
	Dialogic.start("res://dialogTimeline/Scene2.dtl")
	get_viewport().set_input_as_handled()
		

func _on_timer_timeout() -> void:
	$AudioStreamPlayer2D.play()
	
	
