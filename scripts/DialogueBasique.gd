extends MarginContainer


@onready var label = $MarginContainer/Label
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_letter_display_timer_timeout() -> void:
	label.text = "Mais tu veux vraiment jouer à ce jeu ? \n Il est vraiment pas fini, y’a des bugs, le code est pas totalement fini. \n T’es vraiment sûr ? "
	await get_tree().create_timer(3.0).timeout
	$"../Panneau boutons".visible = true
	print("PITIE MARCHE")
