extends State
class_name IdleControlState

@export var stats: StatsResource

func _init():
	state_name = 'idle'

func enter():
	animation_player.play('idle')

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
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
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		transitioned.emit(self, 'run')
		return

	character.velocity.x = move_toward(character.velocity.x, 0, stats.take('speed'))
