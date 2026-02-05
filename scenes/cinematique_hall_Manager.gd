extends Node2D

var sefoutreenlair = true
@onready var Me = $Me
@onready var KG = $KawaineGirl
@onready var Senpai = $Senpai
@onready var MeMoving = true
@onready var KMoving = false
@onready var MeDestination_position = $Targets/MeDestination.global_position
@onready var KDestination_position = $Targets/KawaineGirlDestination.global_position
@export var MeSpeed = 200
@export var KSpeed = 2500
signal Senpaaaaai()
signal confessionFinie

func _process(delta: float) -> void:
	_MeMoving(delta)
	_kMoving(delta)
	
func _MeMoving(delta):
	if MeMoving:
		Me.global_position = Me.global_position.move_toward(MeDestination_position, delta * MeSpeed)
	if Me.global_position == MeDestination_position:
		MeMoving = false
		await get_tree().create_timer(1.5).timeout
		KMoving = true
		
func _kMoving(delta):
	if KMoving:
		KG.global_position = KG.global_position.move_toward(KDestination_position, delta * KSpeed)
	if KG.global_position == KDestination_position:
		KMoving = false
		Senpaaaaai.emit()
	
	


func _on_senpaaaaai() -> void:
		#get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/scene_confession.tscn")
		
		#print("que pasa")
		#await get_tree().create_timer(1).timeout
