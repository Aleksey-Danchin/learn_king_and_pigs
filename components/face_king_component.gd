class_name FaceKingComponent
extends FaceComponent

@export var animated_sprite: AnimatedSprite2D
@export var hitbox_shape: CollisionShape2D

func _face_to_left():
	animated_sprite.flip_h = true
	animated_sprite.position.x = -7
	hitbox_shape.position.x = -27

func _face_to_right():
	animated_sprite.flip_h = false
	animated_sprite.position.x = 7
	hitbox_shape.position.x = 27
