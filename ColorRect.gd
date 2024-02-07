extends ColorRect

# Called when the node enters the scene tree for the first time.
@onready var callBack = Callable(self, "makeInvisable" )

func makeInvisable(b: bool):
	visible = b 
