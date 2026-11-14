extends RigidBody2D

@export var rest_angle := -25.0
@export var up_angle := 35.0
@export var speed := 1200.0
@export var input_action := "Right flipper"

func _physics_process(delta: float) -> void:
	var target := up_angle if Input.is_action_pressed(input_action) else rest_angle
	rotation_degrees = move_toward(rotation_degrees, target, speed * delta)
