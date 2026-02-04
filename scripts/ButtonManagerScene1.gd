extends Button



func _on_oui_pressed() -> void:
	$"../../../textBox/MarginContainer/Label".text = "Bon ok, mais c’est vraiment pas abouti, prend ça comme une démo."
	$".".disabled = true
	$"../non".disabled = true
	await get_tree().create_timer(5.0).timeout
	get_tree().change_scene_to_file("res://scenes/Scene2Chambre.tscn")

func _on_non_pressed() -> void:
	$"../../../textBox/MarginContainer/Label".text = "Tu me déçois... \n Au revoir."
	$"../non".disabled = true
	$".".disabled = true
	await get_tree().create_timer(4.0).timeout
	get_tree().quit()
