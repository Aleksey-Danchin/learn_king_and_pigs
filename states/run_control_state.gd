extends State
class_name RunControlState

@export var stats: StatsResource
@export var speed_default: float = 0

func _init():
	state_name = 'run'

func enter():
	animation_player.play('run')

func exit():
	pass

func update(delta: float):
	pass

	

func physics_update(delta: float) -> void:
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		character.velocity.x = direction * stats.take('speed', speed_default)
	
	if character.velocity.y > 0:
		transitioned.emit(self, 'fall')
		return
	
	if character.velocity.y < 0:
		transitioned.emit(self, 'jump')
		return
	
	if Input.is_action_just_pressed('action_hit'):
		transitioned.emit(self, 'hit')
		return
	
	if Input.is_action_just_pressed("move_up") and character.is_on_floor():
		transitioned.emit(self, 'jump')
		return
	
	if not direction:
		transitioned.emit(self, 'idle')
		return
