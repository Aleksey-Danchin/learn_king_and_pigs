extends FacedCharacterBody2D

@onready var king_character = $"."
@onready var king_node = $KingNode2D
@onready var animated_sprite = $KingNode2D/AnimatedSprite2D
@onready var animation_player = $KingNode2D/AnimationPlayer
@onready var gravity_shape = $GravityShape
@onready var hitbox_area = $HitboxArea
@onready var hitbox_shape = $HitboxArea/HitboxShape

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _face_to_left():
	animated_sprite.flip_h = true
	animated_sprite.position.x = -7
	hitbox_shape.position.x = -38

func _face_to_right():
	animated_sprite.flip_h = false
	animated_sprite.position.x = 7
	hitbox_shape.position.x = 38

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
