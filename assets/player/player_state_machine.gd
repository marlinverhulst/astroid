extends StateMachine

@onready var sprite = $CharacterBody2D/AnimatedSprite2D
@onready var character = $CharacterBody2D
const SPEED = 200.0
const JUMP_VELOCITY = -300.0
var gravity = 450


var stateNames = {
	'Idle' : 'Idle',
	'Walk' : 'Walk',
	'Jump':'Jump' 
	  }
	
@onready var states = {
	stateNames.Idle :$States/Idle, 
	stateNames.Walk :$States/Walk, 
	stateNames.Jump :$States/Jump
}

func _ready():
	initStateMachine(states, stateNames.Idle)
