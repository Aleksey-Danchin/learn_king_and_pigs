extends State
class_name HurtControlState

func _ready():
	state_name = 'hurt'

func enter():
	animation_player.play('hurt')
	await animation_player.animation_finished
	
	if character.velocity.y < 0:
		transitioned.emit(self, 'jump')
		return
	
	if character.velocity.y > 0:
		transitioned.emit(self, 'fall')
		return
	
	transitioned.emit(self, 'idle')
