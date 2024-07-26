extends State
class_name JumpControlState

@export var stats: StatsResource

func _init():
	state_name = 'jump'

func enter():
	animation_player.play('jump')
	if character.velocity.y >= 0:
		character.velocity.y = stats.take('jump')

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float) -> void:
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		character.velocity.x = direction * stats.take('speed')
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, stats.take('speed'))
		
	if character.velocity.y > 0:
		transitioned.emit(self, 'fall')
		return
	
	if Input.is_action_just_pressed('action_hit'):
		transitioned.emit(self, 'hit')
		return
	
	if character.is_on_floor():
		transitioned.emit(self, 'ground')
		return
