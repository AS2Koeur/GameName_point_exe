extends Node2D

var clics = 0
var kawaine = false
var SPEED = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_Sonnerie_Sonne)
	Dialogic.start("res://dialogTimeline/Scene4.dtl")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	if kawaine:
		$KawaineGirl.position = $Me.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Sonnerie_Sonne(argument : String):
	if argument == "CasierOn":
		$CasierRose.visible = true


func _on_sortie_interdite_body_entered(body: CharacterBody2D) -> void:
	if Dialogic.current_timeline != null:
		return
	Dialogic.start("res://dialogTimeline/Scene4TryExit.dtl")


func _on_sortie_droite_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://scenes/toilett_es.tscn")


func _on_sortie_haut_salle_info_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://scenes/classe.tscn")


func _on_sortie_bas_droite_classe_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://scenes/SalleInfo.tscn")
	


func _on_sortie_bas_gauche_body_entered(body: CharacterBody2D) -> void:
	pass # Replace with function body.





func _on_area_Casier_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var x = 1
	var y = 1
	if event is  InputEventMouseButton and event.pressed == true:
		if clics <3:
			clics += 1
			$CasierRose.scale = Vector2(x,y)
			x += 0.5
			y += 0.1
			print(x)
		elif clics == 3:
			$Feuille.visible = true
			$Feuille/FeuilleArea/CollisionShape2D.disabled = false
		if clics == 1:
			Dialogic.start("res://dialogTimeline/Scene4MiniDialogue.dtl")
			$Feuille2.visible = true
		if clics == 2:
			$Feuille3.visible = true
			Dialogic.start("res://dialogTimeline/4eClicCasier.dtl")
	print(clics)
func _on_feuille_area_body_entered(body: CharacterBody2D) -> void:
	$Feuille.visible = false
	$Feuille/FeuilleArea/CollisionShape2D.disabled = true
	$Feuille/FeuilleArea.visible = false
	Dialogic.start("res://dialogTimeline/Scene4FeuilleRecup.dtl")
	$KawaineGirl.visible = true
	kawaine = true
