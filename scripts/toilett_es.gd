extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Me/AnimatedSprite2D.play("IdleAled")
	Dialogic.start("res://dialogTimeline/SceneFinale.dtl")
	Dialogic.signal_event.connect(_LibereeeeeeeeeeDelivreeeeeee)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_couloir_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://scenes/Scene4Hall.tscn")

func _LibereeeeeeeeeeDelivreeeeeee(argument : String):
	if argument == "Fini":
		$"Ecran Noir".visible = true
		await get_tree().create_timer(3).timeout
		get_tree().quit()
