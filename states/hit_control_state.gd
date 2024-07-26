extends State
class_name HitControlState

func _ready():
	state_name = 'hit'

func enter():
	animation_player.play('hit')
	character.velocity.x = 0
	await animation_player.animation_finished
	
	if character.velocity.y < 0:
		transitioned.emit(self, 'jump')
		return
	
	if character.velocity.y > 0:
		transitioned.emit(self, 'fall')
		return
	
	transitioned.emit(self, 'idle')
	
