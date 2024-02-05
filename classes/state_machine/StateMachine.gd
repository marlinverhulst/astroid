class_name StateMachine
extends Node

var internalStates
var currentState: State

func initStateMachine(states, initialState) -> void:
	internalStates = states
	changeState(initialState)
	
	
func changeState(name: String) -> void :
	if currentState :
		currentState.stateExit(name)
	var newState = internalStates[name]
	newState.init(self)
	currentState = newState
	currentState.stateEntered()
	
func _physics_process(delta):
	if(currentState):
		currentState.statePhysicsProcess(delta)

func _process(delta):
	if(currentState):
		currentState.stateProcess(delta)
	
func _unhandled_input(event):
	if(currentState):
		currentState.stateUnhandledInput(event)

func _input(event):
	if(currentState):
		currentState.stateInput(event)	


