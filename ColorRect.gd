extends ColorRect

# Called when the node enters the scene tree for the first time.
@onready var callBack = Callable(self, "makeInvisable" )
var subscriptionId
func _ready() -> void :
	pass

func _process(delta) -> void:
	subsribeToBackspace()
	if Input.is_action_just_pressed("ui_down"):
		get_parent().backspaceSubject.unsubscribe(subscriptionId)
	
func makeInvisable(b: bool) -> void:
	visible = b 

func subsribeToBackspace() -> void:
	if !subscriptionId:
		print("Trying")
		if get_parent().is_node_ready(): 
			print("subscribing")
			subscriptionId = get_parent().backspaceSubject.subscribe(callBack)
