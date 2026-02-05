extends Node2D


@onready var discussionDiscord = $ScreenDiscord
var ScreenDespawn = false
func _ready() -> void:
	Dialogic.start("res://dialogTimeline/Scene5.dtl")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sortie_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://scenes/cinematique_hall.tscn")
	Dialogic.end_timeline(true)


func _on_first_pc_body_entered(body: CharacterBody2D) -> void:
	Dialogic.start("res://dialogTimeline/Scene5.dtl", "interaction PC1")


func _on_second_pc_body_entered(body: CharacterBody2D) -> void:
	Dialogic.start("res://dialogTimeline/Scene5.dtl", "interaction PC3")


func _on_third_pc_body_entered(body: CharacterBody2D):
	Dialogic.start("res://dialogTimeline/Scene5.dtl", "interaction LEPC")
	await get_tree().create_timer(4).timeout
	discussionDiscord.visible = true
	await get_tree().create_timer(2).timeout
	discussionDiscord.visible = false
	ScreenDespawn = true
	if ScreenDespawn:
		Dialogic.start("res://dialogTimeline/Scene5.dtl", "CrashOut")
	
	
	
	
	


func _on_fourth_pc_body_entered(body: CharacterBody2D) -> void:
	Dialogic.start("res://dialogTimeline/Scene5.dtl", "interaction PC2")
