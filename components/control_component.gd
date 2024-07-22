class_name ControlComponent
extends Node

@export var character: CharacterBody2D
@export var speed_max := 300.0
@export var jump_velocity := -400.0

func _physics_process(delta):
	if Input.is_action_just_pressed("move_up") and character.is_on_floor():
		character.velocity.y = jump_velocity
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		character.velocity.x = direction * speed_max
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, speed_max)
	
	character.move_and_slide()
