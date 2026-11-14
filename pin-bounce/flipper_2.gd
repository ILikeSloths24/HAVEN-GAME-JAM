extends RigidBody2D

var rotation_value = -15

func _physics_process(delta):
	if Input.is_action_pressed("Right flipper"): 
		if rotation_value < 45:
			rotation_value += 700 * delta
		else:
			rotation_value = 45
	else:
		if rotation_value > -15:
			rotation_value -= 700 * delta 
		else:
			rotation_value = -15          

	rotation_degrees = rotation_value
