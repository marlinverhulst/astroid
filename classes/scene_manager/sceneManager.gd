extends Node2D
class_name ScreenManager

@export var rootNode: Node
var sceneToLoad: String
var loading =  false	

func _ready() -> void :
		print('Scene loader ready')
		
func changeSceneWithLoading(nextScenePath: String, loadScreenPath: String, minWaitingTime = 3):
	$Timer.set_wait_time(minWaitingTime)
	loading = true
	sceneToLoad = nextScenePath
	var loadScreen = load(loadScreenPath)
	removePreviousScreen()
	rootNode.add_child(loadScreen.instantiate())
	ResourceLoader.load_threaded_request(nextScenePath)
	
func _process(_delta):
	if loading and ResourceLoader.THREAD_LOAD_LOADED:
		$Timer.start()
		loading = false
		
func removePreviousScreen() -> void:
	if rootNode.get_child_count() > 0:
		rootNode.get_child(0).queue_free()
		
func addNextScene():
	removePreviousScreen()
	var newScene = ResourceLoader.load_threaded_get(sceneToLoad)
	rootNode.add_child(newScene.instantiate())	
	
