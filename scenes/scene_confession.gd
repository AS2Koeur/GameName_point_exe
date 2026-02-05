extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_cinematique_finie)
	Dialogic.start("res://dialogTimeline/Cinematique.dtl", "Confession")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_cinematique_finie(argument : String):
	if argument == "ConfessionFinieee":
		get_tree().change_scene_to_file("res://scenes/cinematique_fuite.tscn")
