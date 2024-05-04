extends Node2D

@onready var start_position_marker = $StartPosition
@onready var player = $Player

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_deathzone_body_entered(_body):
	reset_player()

func _on_trap_touched_player():
	reset_player()

func reset_player():
	player.velocity = Vector2.ZERO
	player.position = start_position_marker.global_position
