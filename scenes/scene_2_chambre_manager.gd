extends Control


#@onready var textBox = $textBox

#@export var dialogue : Array[String]

#var DialogueIndex = 0
func _ready() -> void:
	await get_tree().create_timer(2.0)
	$BegininTimer.start()
	await $AudioStreamPlayer2D.finished
	if Dialogic.current_timeline != null:
		return
	await get_tree().create_timer(2.0)
	Dialogic.start("res://dialogTimeline/Scene2.dtl")
	get_viewport().set_input_as_handled()
		
func _on_timer_timeout() -> void:
	$AudioStreamPlayer2D.play()
	#await get_tree().create_timer(2.0).timeout
	#textBox.visible = true
	#await get_tree().create_timer(2.0).timeout
	#$textBox/MarginContainer/Label.visible = true
	#$dialogTimer.start()
	


func _on_dialog_timer_timeout() -> void:
	pass
	#if DialogueIndex < 3:
		#$textBox/MarginContainer/Label.text = dialogue[DialogueIndex]
		#DialogueIndex += 1
		#print(DialogueIndex)
	#else:
		#$dialogTimer.one_shot = true
