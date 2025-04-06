extends Area2D

signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _process(delta):
	
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		velocity.x += 5
	if Input.is_action_pressed("move_left"):
		velocity.x -= 5

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	var sprite_half_size = Vector2(185, 55) / 2 # (width, height) of one frame
	position = position.clamp(sprite_half_size, screen_size - sprite_half_size)

func _on_body_entered(_body):
	hide() # Player disappears after being hit.
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
