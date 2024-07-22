class_name FaceComponent
extends Node

@export var character: CharacterBody2D;

enum FaceTo {left, right}

@export var face: FaceTo = FaceTo.right:
	set (value):
		if face != value:
			face = value
			if value == FaceTo.left:
				_face_to_left()
			else:
				_face_to_right()

func _physics_process(delta):
	if character.velocity.x < 0 and face != FaceTo.left:
		face = FaceTo.left
	elif character.velocity.x > 0 and face != FaceTo.right:
		face = FaceTo.right

func _ready():
	if face == FaceTo.left:
		_face_to_left()
	else:
		_face_to_right()

func _face_to_left():
	pass

func _face_to_right():
	pass


