extends Node2D

var left_rotation = 0
var right_rotation = 0

func _physics_process(delta):
	if Input.is_action_pressed("Left flipper"):
		if left_rotation > -47.5:
			left_rotation -= 750 * delta 
		elif left_rotation <= -47.5:
			left_rotation = 47.5
	else:
		if left_rotation < 0:
			left_rotation += 750 * delta 
		if left_rotation >= 0:
			left_rotation = 0
			
	if Input.is_action_pressed("Right flipper"):
		if right_rotation > 47.5:
			right_rotation += 750 * delta 
		elif right_rotation >= 47.5:
			right_rotation = 47.5
	else:
		if right_rotation > 0:
			right_rotation -= 750 * delta 
		if right_rotation <= 0:
			right_rotation = 0
	
