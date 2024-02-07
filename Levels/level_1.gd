extends StateMachine

var stateNames = {
	'GAME_STARTED' : 'GAME_STARTED',
	 'DEMO' : 'DEMO'
	  }
	
@onready var states = {
	stateNames.GAME_STARTED :$States/Game_Started, 
	stateNames.DEMO :$States/Demo 
}

func _ready():
	initStateMachine(states, stateNames.DEMO)

