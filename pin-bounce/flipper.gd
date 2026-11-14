extends RigidBody2D

var rotation_value = -15
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("Left flipper"):
		if rotation_value > -45:
			rotation_value -= 700 * delta 
		elif rotation_value <= -45:
			rotation_value = -45
	else:
		if rotation_value < 15:
			rotation_value += 700 * delta 
		if rotation >= 15:
			rotation_value = 15
	
	rotation_degrees = rotation_value
