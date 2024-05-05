extends CharacterBody2D
class_name Player

@export var gravity: int = 400
@export var jump_force: int = 200
@export var speed: int = 125

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var active = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 500:
			velocity.y = 500
	
	var direction = 0
	if active:
		#if is_on_floor() and 
		if Input.is_action_just_pressed("jump"):
			jump(jump_force)
		
		direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		animated_sprite.flip_h = (direction == -1)
	velocity.x = direction * speed
	
	move_and_slide()
	
	update_animations(direction)

func jump(force):
	velocity.y = -force

func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")

