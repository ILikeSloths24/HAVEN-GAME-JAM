extends StaticBody2D

@export var bounce_force := 600.0

func _on_hit_zone_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		# Calculate direction pointing outward from the bumper to the ball
		var push_direction := (body.global_position - global_position).normalized()
		
		# Reset current velocity slightly so the bounce feels snappy and consistent
		body.linear_velocity = Vector2.ZERO
		
		# Launch the ball outward
		body.apply_central_impulse(push_direction * bounce_force)
