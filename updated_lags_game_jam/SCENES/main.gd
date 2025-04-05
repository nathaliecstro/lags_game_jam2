extends Node

@export var mob_scene: PackedScene
@export var mob1_scene: PackedScene

var score

func game_over():
	$ScoreTimer.stop()
	$FoodTimer.stop()

func new_game():
	score = 0
	$CharacterBody2D.start($StartPos.position)
	$StartTimer.start()
	
	
func _on_food_timer_timeout():
	# Randomly pick a food scene
	var selected_scene = mob_scene if randf() < 0.5 else mob1_scene
	
	# Create a new instance of the chosen food scene
	var food = selected_scene.instantiate()

	# Choose a random location on Path2D
	var food_spawn_location = $FoodPath/FoodFollow2D
	food_spawn_location.progress_ratio = randf()

	# Set position
	food.position = food_spawn_location.position

	# Force the direction down
	var direction = PI / 2
	food.rotation = direction

	# Set downward velocity
	var velocity = Vector2(0.0, randf_range(150.0, 250.0))
	food.linear_velocity = velocity

	# Add to scene
	add_child(food)




func _on_score_timer_timeout():
	score += 1

func _on_start_timer_timeout():
	$FoodTimer.start()
	$ScoreTimer.start()

func _ready():
	new_game()
	
