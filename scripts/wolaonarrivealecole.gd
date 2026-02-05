extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	Dialogic.start("res://dialogTimeline/Scene3.dtl")
	

func _on_droite_body_entered(body: CharacterBody2D) -> void:
	if Dialogic.current_timeline != null:
		return
	Dialogic.start("res://dialogTimeline/Scene3Bis.dtl")


func _on_scene_exit_body_entered(body: CharacterBody2D) -> void:
	print("quelqu'un est passé par là")
	get_tree().change_scene_to_file("res://scenes/Scene4Hall.tscn")
