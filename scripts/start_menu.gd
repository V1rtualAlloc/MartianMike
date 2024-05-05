extends Control

var start_level_scene: String = "res://scenes/level.tscn"

func _on_start_pressed():
	get_tree().change_scene_to_file(start_level_scene)

func _on_quit_pressed():
	get_tree().quit()
