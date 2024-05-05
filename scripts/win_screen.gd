extends Control

var start_menu_scene: String = "res://scenes/start_menu.tscn"

func _on_button_pressed():
	get_tree().change_scene_to_file(start_menu_scene)
