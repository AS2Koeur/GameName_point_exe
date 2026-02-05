extends Sprite2D

var TOURNE = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if TOURNE:
		scale = Vector2.ONE * randf_range(0.1,1.9)
		rotate(randf_range(0,40))
	


func _on_cinematique_hall_senpaaaaai() -> void:
	TOURNE = false
	print("???")
