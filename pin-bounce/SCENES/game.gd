extends Node2D

var score := 0
@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var launcher_spawn: Marker2D = $LauncherSpawn

func add_points(amount: int) -> void:
	score += amount
	score_label.text = "Score: " + str(score)

func _on_drain_zone_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		call_deferred("reset_ball_to_tube", body)

func reset_ball_to_tube(ball: RigidBody2D) -> void:
	# Stop all motion
	ball.linear_velocity = Vector2.ZERO
	ball.angular_velocity = 0.0
	
	# Safely move the RigidBody2D directly inside the physics server
	var spawn_transform := Transform2D(0.0, $LauncherSpawn.global_position)
	PhysicsServer2D.body_set_state(
		ball.get_rid(),
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		spawn_transform
	)
