extends State
class_name IdleBotState

@export var patrol_after := false
@export var	patrol_delay := 0.5
var delay := 0.5

func _init():
	state_name = 'idle'
	delay = patrol_delay

func _process (delta: float):
	if patrol_after:
		delay = max(delay - delta, 0)
	
		if not delay:
			transitioned.emit(self, 'patrol')

func enter():
	animation_player.play('idle')
