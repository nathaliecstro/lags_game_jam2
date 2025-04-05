extends CharacterBody2D
signal hit

const SPEED : int = 800

func _physics_process(delta):
	velocity.x = 0
	
	if Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x = SPEED
	move_and_slide()


func _on_area_2d_body_entered(body):
	hide() # Player disappears after being hit.
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
