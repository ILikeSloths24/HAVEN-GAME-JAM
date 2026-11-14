extends Node2D

var score := 0
var lives := 3
var is_game_over := false

@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var game_over_label: Label = $CanvasLayer/GameOverLabel
@onready var launcher_spawn: Marker2D = $LauncherSpawn

@onready var life_icons: Array[Sprite2D] = [
	$CanvasLayer/Life1,
	$CanvasLayer/Life2,
	$CanvasLayer/Life3
]

func _process(_delta: float) -> void:
	if is_game_over and Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()

func add_points(amount: int) -> void:
	if not is_game_over:
		score += amount
		score_label.text = "Score: " + str(score)

func _on_drain_zone_body_entered(body: Node2D) -> void:
	if body.name == "Ball" and not is_game_over:
		lives -= 1
		
		if lives >= 0 and lives < life_icons.size():
			life_icons[lives].visible = false
		
		if lives > 0:
			call_deferred("reset_ball_to_tube", body)
		else:
			is_game_over = true
			game_over_label.text = "GAME OVER\nFinal Score: " + str(score) + "\nPress R to Restart"
			game_over_label.visible = true
			body.queue_free()


func reset_ball_to_tube(ball: RigidBody2D) -> void:
	ball.linear_velocity = Vector2.ZERO
	ball.angular_velocity = 0.0
	var spawn_transform := Transform2D(0.0, launcher_spawn.global_position)
	PhysicsServer2D.body_set_state(
		ball.get_rid(),
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		spawn_transform
	)
