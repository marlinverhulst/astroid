class_name State
extends Node

var host

func init(h) -> void :
	host = h
	
func stateInput(event: InputEvent) -> void :
	pass	

func stateUnhandledInput(event: InputEvent) -> void :
	pass

func stateProcess(delta: float) -> void :
	pass

func statePhysicsProcess(delta: float) -> void :
	pass
	
func stateEntered() -> void :
	pass
	
func stateExit(nextState: String) -> void :
	pass
	
