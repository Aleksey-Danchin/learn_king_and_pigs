extends State
class_name PatrolState

@export var stats: StatsResource
@export var speed_default := 200
@export var left_raycast: RayCast2D
@export var right_raycast: RayCast2D
@export_enum('left', 'right') var direction := 'left'

func _init():
	state_name = 'patrol'

func enter():
	animation_player.play('run')

func physics_update(delta):
	var dir_flag = 1 if direction == 'right' else -1
	character.velocity.x = stats.take('speed', speed_default) * dir_flag
	
	if direction == 'left' and not left_raycast.is_colliding():
		direction = 'right'
	elif direction == 'right' and not right_raycast.is_colliding():
		direction = 'left'

