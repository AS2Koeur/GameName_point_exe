extends Control


@onready var reveil = $AnimationPlayer
@onready var poster = $AnimatedSprite2D
var posterIndex = 1
func _ready() -> void:
	
	await get_tree().create_timer(2.0).timeout
	$BegininTimer.start()
	
	await $AudioStreamPlayer2D.finished
	if Dialogic.current_timeline != null:
		return
	await get_tree().create_timer(2.0)
	Dialogic.start("res://dialogTimeline/Scene2.dtl")
	get_viewport().set_input_as_handled()
	
func _process(float) -> void:
	_poster_change()

func _on_timer_timeout() -> void:
	$AudioStreamPlayer2D.play()
	reveil.play("reveil")
	await $AudioStreamPlayer2D.finished
	reveil.stop()
	
func _poster_change():
	$AnimatedSprite2D.play(str(posterIndex))
	if posterIndex <= 5 && Input.is_action_just_pressed("SkipChambre"):
		posterIndex += 1
		print(posterIndex)
	elif posterIndex > 5 && Input.is_action_just_pressed("SkipChambre"):
		get_tree().change_scene_to_file("res://scenes/wolaonarrivealecole.tscn") 

func _on_skip_pressed() -> void:
	get_tree().reload_current_scene()
