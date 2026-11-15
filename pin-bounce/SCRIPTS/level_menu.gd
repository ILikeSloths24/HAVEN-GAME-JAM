extends Node2D

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/game.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/Map 2.tscn")
