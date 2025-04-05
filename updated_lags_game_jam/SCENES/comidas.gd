extends RigidBody2D

func _ready():
	var comidas = $AnimatedSprite2D.sprite_frames.get_animation_frames() # crea una lista con los nombres de las animaciones
	$AnimatedSprite2D.play(comidas[randi()%comidas.size()])

func _process(delta: float) -> void:
	pass 


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() 
