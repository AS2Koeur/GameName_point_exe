extends CharacterBody2D


@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var directionX := Input.get_axis("ui_left", "ui_right")
	var directionY := Input.get_axis("ui_up", "ui_down")
	
	if directionX:
		velocity.x = -directionX * SPEED
		if velocity.x > 0:
			$AnimatedSprite2D.play("Droite")
		else:
			$AnimatedSprite2D.play("Gauche")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if directionY:
		velocity.y = directionY * SPEED
		if velocity.y > 0:
			$AnimatedSprite2D.play("Front")
		else:
			$AnimatedSprite2D.play("Back")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if directionX || directionY:
		$AudioStreamPlayer2D.play()

	move_and_slide()
