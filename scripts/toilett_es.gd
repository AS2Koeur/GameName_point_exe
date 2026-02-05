extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Me/AnimatedSprite2D.play("IdleAled")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_couloir_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://scenes/Scene4Hall.tscn")
