extends StaticBody2D

@export var bounce_force := 600.0
@export var points := 10

func _on_hit_zone_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		var push_direction := (body.global_position - global_position).normalized()
		body.linear_velocity = Vector2.ZERO
		body.apply_central_impulse(push_direction * bounce_force)
		
		# Add points via the root Node2D
		get_tree().current_scene.add_points(points)
