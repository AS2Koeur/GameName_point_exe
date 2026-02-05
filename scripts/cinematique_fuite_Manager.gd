extends Node2D

@onready var Senpaiii = $Senpai
@onready var MeSprite = $Me/AnimatedSprite2D
@onready var Me = $Me
@onready var KG = $KawaineGirl
@onready var MeMoving = true
@onready var KMoving = false
@onready var MeDestination_position = $Targets/MeDestination.global_position
@onready var KDestination_position = $Targets/KawaineGirlDestination.global_position
@export var MeSpeed = 1000
@export var KSpeed = 6000
var ararahrharah = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MeSprite.play("Back")
	_Kaboom()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ararahrharah:
		_kMoving(delta)
		_MeMoving(delta)
		

func _Kaboom():
	await get_tree().create_timer(2).timeout
	Senpaiii.visible = false
	MeSprite.play("IdleAled")
	await get_tree().create_timer(1).timeout
	ararahrharah = true
	

func _MeMoving(delta):
	#await get_tree().create_timer(2).timeout
	if MeMoving:
		Me.global_position = Me.global_position.move_toward(MeDestination_position, delta * MeSpeed)
	if Me.global_position == MeDestination_position:
		MeMoving = false
		#await get_tree().create_timer(1.5).timeout
		KMoving = true
		
func _kMoving(delta):
	if KMoving:
		KG.global_position = KG.global_position.move_toward(KDestination_position, delta * KSpeed)
	if KG.global_position == KDestination_position:
		KMoving = false
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/toilett_es.tscn")
	
	
	
