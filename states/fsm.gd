extends Node
class_name FinishStateMachine

@export var character : CharacterBody2D
@export var animated_sprite: AnimatedSprite2D
@export var animation_player: AnimationPlayer
@export var state_initial: State
@export var stats: StatsResource

var state_current: State
var states = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.state_name] = child
			child.transitioned.connect(on_change_transition)
			child.set('stats', stats)
	
	if state_initial:
		state_current = state_initial
		state_initial.enter()

func _process(delta):
	if state_current:
		state_current.update(delta)

func _physics_process(delta):
	if state_current:
		state_current.physics_update(delta)
	character.move_and_slide()

func on_change_transition(state_emitter: State, state_next_name: String):
	if state_emitter != state_current:
		return
	
	var state_next: State = states.get(state_next_name.to_lower())
	if not state_next:
		return
	
	if state_current:
		state_current.exit()
	
	state_current = state_next
	state_next.enter()
