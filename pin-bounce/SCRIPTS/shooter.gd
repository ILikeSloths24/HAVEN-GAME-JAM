extends AnimatableBody2D

@export var max_pull_distance := 80.0
@export var pull_speed := 100.0
@export var launch_speed := 1500.0
@export var launch_action := "launch" 

var start_y := 0.0
var current_pull := 0.0

func _ready() -> void:
	start_y = position.y

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed(launch_action):
		current_pull = move_toward(current_pull, max_pull_distance, pull_speed * delta)
	else:
		current_pull = move_toward(current_pull, 0.0, launch_speed * delta)
	
	position.y = start_y + current_pull
