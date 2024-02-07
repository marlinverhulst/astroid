extends State

@onready var demoPlayer = get_parent().get_parent().get_node("DemoPlayer")
var subscriptionId

func stateEntered(): 
	print('Demo entered')
	
	var demoScene = load("res://Cut_Scenes/Intro/level_1_cut_scene.tscn")
	var scene = demoScene.instantiate()
	demoPlayer.add_child(demoScene.instantiate())
	
func stateProcess(delta):
	subscribeTodemoDoneSubject()

func stateExit(nextState: String) -> void :
	demoPlayer.queue_free()
		
func demoEnded(b: bool) -> void : 
	host.changeState('GAME_STARTED')

func subscribeTodemoDoneSubject() -> void:
	if !subscriptionId:
		print('try')
		if demoPlayer.get_child(0).is_node_ready(): 
			var callBack = Callable(self,"demoEnded")
			subscriptionId = demoPlayer.get_child(0).demoDoneSubject.subscribe(callBack)
			print('subscribed')
